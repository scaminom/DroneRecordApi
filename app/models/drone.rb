class Drone < ApplicationRecord
  belongs_to :user
  # belongs_to :station
  has_one :solar_panel

  WHITELISTED_ATTRIBUTES = %i[
    fecha_registro
    voltaje
    corriente
    altitud
    velocidad
    modo_vuelo
    latitud
    longitud
    user_id
  ].freeze
end
