FactoryBot.define do
  factory :dc_charging_station do
    registration_date { Faker::Date.between(from: 2.years.ago, to: 1.year.ago) }
    dc_current { Faker::Number.decimal(l_digits: 2) }
    dc_power { Faker::Number.decimal(l_digits: 2) }
    drone
  end
end
