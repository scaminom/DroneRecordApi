FactoryBot.define do
  factory :drone_data do
    registration_date { Faker::Date.between(from: 2.years.ago, to: 1.year.ago) }
    voltage { Faker::Number.decimal(l_digits: 2) }
    battery_percentage { Faker::Number.decimal(l_digits: 2) }
    current { Faker::Number.decimal(l_digits: 2) }
    flight_mode { Faker::Lorem.word }
    speed { Faker::Number.decimal(l_digits: 2) }
    altitude { Faker::Number.decimal(l_digits: 2) }
    latitude { Faker::Number.between(from: -90.0, to: 90.0).round(2) }
    longitude { Faker::Number.between(from: -180.0, to: 180.0).round(2) }
    drone
  end
end
