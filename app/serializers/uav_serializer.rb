class UavSerializer < Panko::Serializer
  attributes  :id,
              :tipo_dron,
              :capacidad_bateria,
              :tipo_placa,
              :max_viento_vuelo,
              :user_name,
              def user_name
                "#{object.user.apellido} #{object.user.nombre}"
              end
end
