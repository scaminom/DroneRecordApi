class SolarPanel < ApplicationRecord
  include Filterable

  belongs_to :drone

  validates :registration_date, presence: true
  validates :panel_voltage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :panel_current, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :battery_voltage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :battery_current, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :controller_voltage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :controller_current, presence: true, numericality: { greater_than_or_equal_to: 0 }

  WHITELISTED_PARAMS = [
    :registration_date,
    :panel_voltage,
    :panel_current,
    :battery_voltage,
    :battery_current,
    :controller_voltage,
    :controller_current,
    :drone_id
  ].freeze
end
