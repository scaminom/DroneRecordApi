class DcChargingStation < ApplicationRecord
  include Filterable

  belongs_to :drone

  validates :registration_date, presence: true
  validates :dc_current, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :dc_power, presence: true, numericality: { greater_than_or_equal_to: 0 }

  WHITELISTED_ATTRIBUTES = [:registration_date, :dc_current, :dc_power, :drone_id].freeze
end
