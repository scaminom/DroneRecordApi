usuarios = [
  {
    username: 'usuario1',
    password: 'contraseña1',
    email: 'usuario1@example.com',
    role: 'admin',
    nombre: 'Juan',
    apellido: 'Gómez'
  },
  {
    username: 'usuario2',
    password: 'contraseña2',
    email: 'usuario2@example.com',
    role: 'admin',
    nombre: 'María',
    apellido: 'Rodríguez'
  },
  {
    username: 'usuario3',
    password: 'contraseña3',
    email: 'usuario3@example.com',
    role: 'admin',
    nombre: 'Carlos',
    apellido: 'López'
  },
  {
    username: 'usuario4',
    password: 'contraseña4',
    email: 'usuario4@example.com',
    role: 'user',
    nombre: 'Ana',
    apellido: 'Martínez'
  },
  {
    username: 'usuario5',
    password: 'contraseña5',
    email: 'usuario5@example.com',
    role: 'user',
    nombre: 'Pedro',
    apellido: 'Sánchez'
  }
]

usuarios.each do |detalles|
  User.create!(detalles)
end

drones = [
  {
    fecha_registro: Date.current,
    voltaje: 12.5,
    corriente: 0.5,
    altitud: 100,
    velocidad: 30,
    modo_vuelo: 'hover',
    latitud: 40.73061,
    longitud: -73.935242,
    user_id: 1
  }
]

drones.each do |detalles|
  Drone.create!(detalles)
end

stations = [
  {
    fecha_registro: Date.current,
    corrienteAC: 5.0,
    voltajeDC: 220.0,
    corrienteDC: 0.5,
    consumo_general: 10.0,
    consumoTX: 5.0,
    drone_id: 1
  }
]

stations.each do |detalles|
  Station.create(detalles)
end
