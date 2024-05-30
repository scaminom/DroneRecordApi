usuarios = [
  {
    username: 'usuario1',
    password: 'contraseña1',
    email: 'usuario1@example.com',
    role: 'admin',
    first_name: 'Juan',
    last_name: 'Gómez'
  },
  {
    username: 'usuario2',
    password: 'contraseña2',
    email: 'usuario2@example.com',
    role: 'admin',
    first_name: 'María',
    last_name: 'Rodríguez'
  },
  {
    username: 'usuario3',
    password: 'contraseña3',
    email: 'usuario3@example.com',
    role: 'admin',
    first_name: 'Carlos',
    last_name: 'López'
  },
  {
    username: 'usuario4',
    password: 'contraseña4',
    email: 'usuario4@example.com',
    role: 'user',
    first_name: 'Ana',
    last_name: 'Martínez'
  },
  {
    username: 'usuario5',
    password: 'contraseña5',
    email: 'usuario5@example.com',
    role: 'user',
    first_name: 'Pedro',
    last_name: 'Sánchez'
  }
]

usuarios.each do |detalles|
  User.create(detalles)
end
