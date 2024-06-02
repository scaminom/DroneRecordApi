class StationSerializer < Panko::Serializer
  attributes :id,
             :fecha_registro,
             :corrienteAC,
             :voltajeDC,
             :corrienteDC,
             :consumo_general,
             :consumoTX
end
