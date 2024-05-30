class Drone < ApplicationRecord
  belongs_to :user
  # belongs_to :station

  WHITELISTED_ATTRIBUTES = %i[
    regitration_date
    voltage
    current
    altitude
    speed
    flight_mode
    latitude
    longitude
  ].freeze
end
