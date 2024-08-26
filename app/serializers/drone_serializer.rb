class DroneSerializer < Panko::Serializer
  attributes  :id,
              :name,
              :description,
              :serial_number,
              :drone_type,
              :battery_capacity,
              :board_type,
              :max_wind_speed,
              :user_name

  def user_name
    "#{object.user.first_name} #{object.user.last_name}"
  end
end
