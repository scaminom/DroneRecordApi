class DroneData < ApplicationRecord
  belongs_to :drone
  self.table_name = 'drones_data'

  include Filterable

  WHITELISTED_PARAMS = %i[
    registration_date
    voltage
    battery_percentage
    current
    flight_mode
    speed
    altitude
    latitude
    longitude
    uav_id
  ].freeze
end
