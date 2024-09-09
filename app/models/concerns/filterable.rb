# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  included do
    scope :by_id, ->(drone_id) { where(drone_id:) if drone_id.present? }
    scope :by_week, -> { within_date_range(Date.current.beginning_of_week(:sunday)..Date.current.end_of_day) }
    scope :by_month, -> { within_date_range(Date.current.beginning_of_month..Date.current.end_of_day) }
    scope :by_day, ->(date) { within_date_range(Date.parse(date).all_day) if date.present? }
    scope :by_current, -> { order(registration_date: :desc).limit(5) }
    scope :by_personalized, ->(params) { within_date_range(date_range(params)) if date_params_present?(params) }

    class << self
      def within_date_range(range)
        where(registration_date: range)
      end

      def date_range(params)
        start_date = params[:start_date].to_date
        end_date = params[:end_date].to_date
        start_date.beginning_of_day..end_date.end_of_day
      end

      def date_params_present?(params)
        params[:start_date].present? && params[:end_date].present?
      end
    end
  end
end
