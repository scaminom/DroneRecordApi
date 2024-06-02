class DroneSerializer < Panko::Serializer
  attributes :id,
             :fecha_registro,
             :voltaje,
             :corriente,
             :altitud,
             :velocidad,
             :modo_vuelo,
             :latitud,
             :longitud
end
