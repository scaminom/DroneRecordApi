class DroneSerializer < Panko::Serializer
  attributes :voltage,
             :current,
             :altitude,
             :speed,
             :flight_mode,
             :latitude,
             :longitude
end
