class AcChargeStationSerializer < Panko::Serializer
  attributes :id,
             :registration_date,
             :ac_current,
             :ac_power
end
