class Drone < ApplicationRecord
  belongs_to :user
  has_many :solar_panels, dependent: :destroy
  has_many :ac_charging_stations, dependent: :destroy
  has_many :dc_charging_stations, dependent: :destroy
  has_many :drones_data, class_name: 'DroneData', dependent: :destroy

  enum drone_type: { multirotor: 0, ala_fija: 1 }
  enum board_type: { arduino: 0, berrypi: 1 }

  validates :name, presence: true, length: { in: 3..50 }
  validates :description, length: { maximum: 500 }, allow_nil: true
  validates :serial_number, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :battery_capacity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :max_wind_speed, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :drone_type, presence:  true, inclusion: { in: drone_types.keys }
  validates :board_type, presence:  true, inclusion: { in: board_types.keys }

  WHITELISTED_ATTRIBUTES = [
    :id,
    :name,
    :description,
    :serial_number,
    :drone_type,
    :battery_capacity,
    :board_type,
    :max_wind_speed,
    :user_id
  ].freeze
end
