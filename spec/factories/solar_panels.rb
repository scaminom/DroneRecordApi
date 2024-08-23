FactoryBot.define do
  factory :solar_panel do
    registration_date { 1.year.ago }
    panel_voltage { Faker::Number.decimal(l_digits: 2) }
    panel_current { Faker::Number.decimal(l_digits: 2) }
    battery_voltage { Faker::Number.decimal(l_digits: 2) }
    battery_current { Faker::Number.decimal(l_digits: 2) }
    controller_voltage { Faker::Number.decimal(l_digits: 2) }
    controller_current { Faker::Number.decimal(l_digits: 2) }
    drone
  end
end
