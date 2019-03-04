# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(email: "tester@test.com", password: "test123")

10.times do |i|
  car = Car.new
  car.name = "Diego's ferrari #{i}"
  car.description = "Amazing car #{i}"
  car.location = "Brussels #{i}"
  car.capacity = 2
  car.price = 300
  car.make = 'Ferrari'
  car.model = 'Spider'
  car.ac = true
  car.fuel = "Diesel"
  car.consumption = "10l/100km"
  car.min_age = 25
  car.year = 2018
  car.kilometers = 102_938
  car.user = user
  car.save!
end
