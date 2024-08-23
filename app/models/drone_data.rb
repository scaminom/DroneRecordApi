class DroneData < ApplicationRecord
  include Filterable

  self.table_name = 'drones_data'

  belongs_to :drone

  validates :registration_date, presence: true
  validates :voltage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :battery_percentage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :current, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :flight_mode, presence: true, length: { maximum: 50 }
  validates :speed, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :altitude, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  WHITELISTED_PARAMS = [
    :registration_date,
    :voltage,
    :battery_percentage,
    :current,
    :flight_mode,
    :speed,
    :altitude,
    :latitude,
    :longitude,
    :drone_id
  ].freeze
end
