# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

User.create(email: 'operador1@gmail.com', password: '291ABASD932')
User.create(email: 'operador2@gmail.com', password: '931SDABA988')

Client.destroy_all
Reason.destroy_all
Call.destroy_all

# Crear razones ficticias
reasons = Reason.create([
  { name: 'Consulta general' },
  { name: 'Queja' },
  { name: 'Sugerencia' },
  { name: 'Soporte técnico' }
])

# Crear 15 clientes ficticios
15.times do
  Client.create!(
    phone_number: Faker::PhoneNumber.phone_number,
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

# Obtener los clientes creados
clients = Client.all

# Crear llamadas ficticias
calls = Call.create([
  { client: clients.sample, reason: reasons.sample, date: Time.now },
  { client: clients.sample, reason: reasons.sample, date: Time.now - 1.day },
  { client: clients.sample, reason: reasons.sample, date: Time.now - 2.days },
  { client: clients.sample, reason: reasons.sample, date: Time.now - 3.days },
  { client: clients.sample, reason: reasons.sample, date: Time.now - 4.days }
])

puts "Se han creado #{Client.count} clientes, #{Reason.count} razones y #{Call.count} llamadas."
