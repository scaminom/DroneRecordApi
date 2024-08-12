class SolarPanel < ApplicationRecord
  belongs_to :drone

  include Filterable

  WHITELISTED_PARAMS = %i[
    registration_date
    panel_voltage
    panel_current
    battery_voltage
    battery_current
    controller_voltage
    controller_current
    drone_id
  ].freeze
end
