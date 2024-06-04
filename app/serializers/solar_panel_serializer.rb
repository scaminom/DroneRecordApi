class SolarPanelSerializer < Panko::Serializer
  attributes :id,
             :fecha_registro,
             :vPan,
             :cPan,
             :vBat,
             :cBat,
             :vCar,
             :cCar
end
