class DroneData < ApplicationRecord
  self.table_name = 'drones_data'

  include Filterable

  # Associations
  belongs_to :drone

  # Validations
  validates :registration_date, presence: true
  validates :flight_mode, length: { maximum: 30 }
  validates :voltage, :battery_percentage, :current, :speed, :altitude, :latitude, :longitude, presence:     true,
                                                                                               numericality: true

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
    :uav_id
  ].freeze
end
