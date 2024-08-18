FactoryBot.define do
  factory :drone do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    serial_number { Faker::Code.npi }
    drone_type { :multirotor }
    battery_capacity { Faker::Number.decimal(l_digits: 2) }
    board_type { :arduino }
    max_wind_speed { Faker::Number.decimal(l_digits: 2) }
    user
  end
end
