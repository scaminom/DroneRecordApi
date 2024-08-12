class Drone < ApplicationRecord
  belongs_to :user
  has_many :solar_panels, dependent: :destroy
  has_many :ac_charging_stations, dependent: :destroy
  has_many :dc_charging_stations, dependent: :destroy
  has_many :drones_data, dependent: :destroy

  validates :name, presence: true
  validates :drone_type, presence: true
  validates :serial_number, presence: true, uniqueness: true

  enum drone_type: { multirotor: 0, ala_fija: 1 }
  enum board_type: { arduino: 0, berrypi: 1 }

  WHITELISTED_ATTRIBUTES = %i[
    id
    name
    description
    serial_number
    drone_type
    battery_capacit
    board_type
    max_wind_speed
    user_id
  ].freeze
end
