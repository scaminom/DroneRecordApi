class DroneDataSerializer < Panko::Serializer
  attributes :id,
             :registration_date,
             :voltage,
             :battery_percentage,
             :current,
             :flight_mode,
             :speed,
             :altitude,
             :latitude,
             :longitude
end
