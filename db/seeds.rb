# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coworking.destroy_all
Booking.destroy_all
User.destroy_all

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

address_list = Geocoder.search("Province of Lima, Lima Metropolitan Area, Lima, Peru")

["Harry Potter", "Hermione Granger", "Ron Weasley",
 "Draco Malfoy", "Luna Lovegood", "Albus Dumbledore",
 "Tom Riddle", "Severus Snape", "Cho Chang",
 "Ginny Weasley", "Juanma Gomez", "Luis Eduardo",
 "Claudia Lujan", "Benjamin Olivera"].each do |name|
  user = User.create(
    name: name,
    email: "#{name.split(" ").first.downcase}@gmail.com",
    password: '12345678',
    password_confirmation: '12345678'
  )
  rand(3..10).times do
    Coworking.create(
      name: "Cowork #{Faker::Superhero.name}",
      address: address_list.sample.address,
      description: Faker::Quotes::Shakespeare.hamlet_quote,
      price: rand(50..200),
      capacity: rand(1..10),
      user: user
    )
  end
end

User.all.each do |user|
  rand(3..10).times do
    start_date = rand(1.month).seconds.from_now
    Booking.create(
      coworking: Coworking.where('user_id != ?', user).sample,
      user: user,
      start_date: start_date,
      end_date: start_date + (rand(1..10) * 60 * 60 * 24),
      accepted: false
    )
  end
end
