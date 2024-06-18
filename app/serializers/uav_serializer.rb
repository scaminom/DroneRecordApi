class UavSerializer < Panko::Serializer
  attributes :id,
             :tipo_dron,
             :capacidad_bateria,
             :tipo_placa,
             :max_viento_vuelo,
             :user_name

  # has_many :panel_solar, each_serializer: SolarPanelSerializer
  # has_many :estacion_carga_dc, each_serializer: DcChargeStationSerializer
  # has_many :estacion_carga_ac, each_serializer: AcChargeStationSerializer
  # has_many :datos_uav, each_serializer: UavDataSerializer
  def user_name
    "#{object.user.apellido} #{object.user.nombre}"
  end
end

