FactoryBot.define do
  factory :ac_charging_station do
    registration_date { Faker::Date.between(from: 2.years.ago, to: 1.year.ago) }
    ac_current { Faker::Number.decimal(l_digits: 2) }
    ac_power { Faker::Number.decimal(l_digits: 2) }
    drone
  end
end
