class Station < ApplicationRecord
  has_many :drones

  WHITELISTED_ATTRS = %i[
    fecha_registro
    corrienteAC
    voltajeDC
    corrienteDC
    consumo_general
    consumoTX
    drone_id
  ].freeze
end
