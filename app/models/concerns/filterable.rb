module Filterable
  extend ActiveSupport::Concern

  included do
    scope :by_id, ->(drone_id) { where(drone_id:) if drone_id.present? }

    scope :by_week, -> { where(registration_date: Date.today.beginning_of_week(:sunday)..Date.today.end_of_day) }

    scope :by_month, -> { where(registration_date: Date.today.beginning_of_month..Date.today.end_of_day) }

    scope :by_day, lambda { |date|
                     if date.present?
                       where(registration_date: Date.parse(date).beginning_of_day..Date.parse(date).end_of_day)
                     end
                   }

    scope :by_current, -> { order(registration_date: :desc).limit(5) }

    scope :by_personalized, lambda { |start_date, end_date|
                              if start_date.present? && end_date.present?
                                where(registration_date: Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day)
                              end
                            }
  end
end
