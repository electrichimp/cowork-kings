# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coworking.destroy_all
Booking.destroy_all

Coworking.create(
  name: "Oficina Cuzco",
  address: "Av El Sol 123",
  description: "gergdtgrtdgerty45ryrthrtghfgdhfgjhfghjghfjfghfgjfghj",
  price: 99.50,
  capacity: 4,
  user: User.find(1)
)

Coworking.create(
  name: "Oficina lima",
  address: "Av Arenales 123",
  description: "gergdtgrtdgerty45ryrthrtghfgdhfgjhfghjghfjfghfgjfghj",
  price: 109.50,
  capacity: 6,
  user: User.find(1)
)

Booking.create(
  coworking: Coworking.find(1),
  user: User.find(1),
  start_date: Date.today,
  end_date: Date.tomorrow,
  accepted: false
)
