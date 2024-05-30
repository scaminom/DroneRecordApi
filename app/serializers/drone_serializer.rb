class DroneSerializer < Panko::Serializer
  attributes :id,
             :registration_date,
             :voltage,
             :current,
             :altitude,
             :speed,
             :flight_mode,
             :latitude,
             :longitude
end
