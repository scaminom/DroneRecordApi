require 'faker'

# Faker data for users
100.times do
  user_data = {
    username: Faker::Internet.unique.username(specifier: 5..10),
    password: Faker::Internet.password,
    email: Faker::Internet.unique.email,
    role: %w[admin user].sample,
    nombre: Faker::Name.first_name,
    apellido: Faker::Name.last_name
  }
  User.create!(user_data)
end

# Faker data for drones
100.times do
  drone_data = {
    fecha_registro: Faker::Time.between(from: 1.year.ago, to: Date.today, format: :default),
    voltaje: Faker::Number.decimal(l_digits: 2),
    corriente: Faker::Number.decimal(l_digits: 1),
    altitud: Faker::Number.between(from: 50, to: 200),
    velocidad: Faker::Number.between(from: 20, to: 50),
    modo_vuelo: %w[hover manual auto].sample,
    latitud: Faker::Address.latitude,
    longitud: Faker::Address.longitude,
    user_id: User.pluck(:id).sample
  }
  Drone.create!(drone_data)
end

# Faker data for stations
100.times do
  station_data = {
    fecha_registro: Faker::Time.between(from: 1.year.ago, to: Date.today, format: :default),
    corrienteAC: Faker::Number.decimal(l_digits: 1),
    voltajeDC: Faker::Number.decimal(l_digits: 3),
    corrienteDC: Faker::Number.decimal(l_digits: 1),
    consumo_general: Faker::Number.decimal(l_digits: 2),
    consumoTX: Faker::Number.decimal(l_digits: 1),
    drone_id: Drone.pluck(:id).sample
  }
  Station.create!(station_data)
end

# Faker data for solar panels
500.times do
  solar_panel_data = {
    fecha_registro: Faker::Time.between(from: 8.years.ago, to: Date.today, format: :default),
    vPan: Faker::Number.decimal(l_digits: (2..3).to_a.sample, r_digits: (1..3).to_a.sample),
    cPan: Faker::Number.decimal(l_digits: (2..3).to_a.sample, r_digits: (1..3).to_a.sample),
    vBat: Faker::Number.decimal(l_digits: (2..3).to_a.sample, r_digits: (1..3).to_a.sample),
    cBat: Faker::Number.decimal(l_digits: (2..3).to_a.sample, r_digits: (1..3).to_a.sample),
    vCar: Faker::Number.decimal(l_digits: (2..3).to_a.sample, r_digits: (1..3).to_a.sample),
    cCar: Faker::Number.decimal(l_digits: (2..3).to_a.sample, r_digits: (1..3).to_a.sample),
    drone_id: Drone.pluck(:id).sample
  }
  SolarPanel.create!(solar_panel_data)
end

