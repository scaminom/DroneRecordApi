class Drone < ApplicationRecord
  belongs_to :user
  has_many :panel_solar, dependent: :destroy
  has_many :estacion_carga_ac, dependent: :destroy
  has_many :estacion_carga_dc, dependent: :destroy
  has_many :datos_uav, dependent: :destroy

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
