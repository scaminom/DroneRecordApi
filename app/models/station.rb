class Station < ApplicationRecord
  has_many :drones

  WHITELISTED_ATTRS = %i[
    registration_date
    currentAC
    voltage
    currentDC
    overall_consumption
    consumptionTX
  ].freeze
end
