# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coworking.destroy_all
Booking.destroy_all

# Coworking.create(
#   name: "Oficina Cuzco",
#   address: "Av El Sol 123",
#   description: "gergdtgrtdgerty45ryrthrtghfgdhfgjhfghjghfjfghfgjfghj",
#   price: 99.50,
#   capacity: 4,
#   user: User.find(1)
# )

# Coworking.create(
#   name: "Oficina lima",
#   address: "Av Arenales 123",
#   description: "gergdtgrtdgerty45ryrthrtghfgdhfgjhfghjghfjfghfgjfghj",
#   price: 109.50,
#   capacity: 6,
#   user: User.find(1)
# )

# Booking.create(
#   coworking: Coworking.find(1),
#   user: User.find(1),
#   start_date: Date.today,
#   end_date: Date.tomorrow,
#   accepted: false
# )

require 'faker'

User.all.each do |user|
  rand(1..5).times do
    Coworking.create(
      name: Faker::Address.street_name,
      address: "Avenida Petit Thouars 2260 Lince Lima Peru",
      description: Faker::Lorem.sentence,
      price: rand(50..200),
      capacity: rand(1..10),
      user: user
    )
  end
  rand(1..5).times do
    start_date = rand(1.years).seconds.from_now
    Booking.create(
      coworking: Coworking.where('user_id != ?', user).sample,
      user: user,
      start_date: start_date,
      end_date: start_date + (rand(1..10) * 60 * 60 * 24),
      accepted: false
    )
  end
end
