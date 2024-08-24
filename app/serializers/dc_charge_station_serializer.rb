class DcChargeStationSerializer < Panko::Serializer
  attributes :id,
             :registration_date,
             :dc_current,
             :dc_power
end
