class SolarPanelSerializer < Panko::Serializer
  attributes :id,
             :registration_date,
             :panel_voltage,
             :panel_current,
             :battery_voltage,
             :battery_current,
             :controller_voltage,
             :controller_current
end
