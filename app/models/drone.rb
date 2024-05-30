class Drone < ApplicationRecord
  belongs_to :user

  WHITELISTED_ATTRIBUTES = %i[
    voltage
    current
    altitude
    speed
    flight_mode
    latitude
    longitude
  ].freeze
end
