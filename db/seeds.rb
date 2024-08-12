# Constants
NUM_DRONES_PER_USER = 5
NUM_SOLAR_PANELS = 20
NUM_AC_CHARGING_STATIONS = 15
NUM_DC_CHARGING_STATIONS = 15
NUM_DRONES_DATA = 25

# Clear existing data
AcChargingStation.delete_all
DcChargingStation.delete_all
SolarPanel.delete_all
DroneData.delete_all
Drone.delete_all
User.delete_all

# Seed Users
users = [
  {
    username: 'jesusMoya',
    password: '123456',
    email: 'jesusMoya@gmail.com',
    role: 'admin',
    first_name: 'Jesus',
    last_name: 'Moya'

  },
  {
    username: 'juanPerez',
    password: '123456',
    email: 'juanPerez@gmail.com',
    role: 'user',
    first_name: 'Juan',
    last_name: 'Perez'
  }
]

created_users = users.map do |user_attrs|
  User.create!(user_attrs)
end

# Seed Drones
drones = []
created_users.each do |user|
  NUM_DRONES_PER_USER.times do
    drones << Drone.create!(
      name: Faker::Space.nasa_space_craft,
      description: Faker::Lorem.sentence(word_count: 10),
      serial_number: Faker::Device.serial,
      drone_type: [0, 1].sample, # multirotor or ala_fija
      battery_capacity: Faker::Number.between(from: 1000.0, to: 5000.0),
      board_type: [0, 1].sample, # arduino or berrypi
      max_wind_speed: Faker::Number.between(from: 10.0, to: 100.0),
      user:
    )
  end
end

# Seed Solar Panels
NUM_SOLAR_PANELS.times do
  SolarPanel.create!(
    registration_date: Faker::Time.backward(days: 365),
    panel_voltage: Faker::Number.between(from: 10.0, to: 50.0),
    panel_current: Faker::Number.between(from: 1.0, to: 10.0),
    battery_voltage: Faker::Number.between(from: 10.0, to: 50.0),
    battery_current: Faker::Number.between(from: 1.0, to: 10.0),
    controller_voltage: Faker::Number.between(from: 10.0, to: 50.0),
    controller_current: Faker::Number.between(from: 1.0, to: 10.0),
    drone: drones.sample
  )
end

# Seed AC Charging Stations
NUM_AC_CHARGING_STATIONS.times do
  AcChargingStation.create!(
    registration_date: Faker::Time.backward(days: 365),
    ac_current: Faker::Number.between(from: 1.0, to: 20.0),
    ac_power: Faker::Number.between(from: 100.0, to: 1000.0),
    drone: drones.sample
  )
end

# Seed DC Charging Stations
NUM_DC_CHARGING_STATIONS.times do
  DcChargingStation.create!(
    registration_date: Faker::Time.backward(days: 365),
    dc_current: Faker::Number.between(from: 1.0, to: 20.0),
    dc_power: Faker::Number.between(from: 100.0, to: 1000.0),
    drone: drones.sample
  )
end

# Seed Drones Data
NUM_DRONES_DATA.times do
  DroneData.create!(
    registration_date: Faker::Time.backward(days: 365),
    voltage: Faker::Number.between(from: 10.0, to: 100.0),
    battery_percentage: Faker::Number.between(from: 0.0, to: 100.0),
    current: Faker::Number.between(from: 1.0, to: 50.0),
    flight_mode: %w[Manual Auto Stabilize Loiter].sample,
    speed: Faker::Number.between(from: 0.0, to: 100.0),
    altitude: Faker::Number.between(from: 0.0, to: 5000.0),
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    drone: drones.sample
  )
end

puts 'Seeding completed successfully!'
