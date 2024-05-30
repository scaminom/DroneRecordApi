class StationSerializer < Panko::Serializer
  attributes :id,
             :registration_date,
             :currentAC,
             :voltage,
             :currentDC,
             :overall_consumption,
             :consumptionTX
end
