class SolarPanel < ApplicationRecord
  belongs_to :drone

  WHITELISTED_ATTRS = %i[
    id
    fecha_registro
    vPan
    cPan
    vBat
    cBat
    vCar
    cCar
  ].freeze
end
