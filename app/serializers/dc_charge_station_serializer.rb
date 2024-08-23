class DcChargeStationSerializer < Panko::Serializer
  attributes :id,
             :fecha_registro,
             :corrienteDC,
             :potenciaDC,
             :drone_id
end
