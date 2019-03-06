# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user123 = User.create!(
  email: "tester@test.com",
  password: "test123",
  password_confirmation: "test123",
  first_name: "Dirk",
  last_name: "Vercammen",
  location: "Brussels",
  description: "Waddup, I love fast cars and I want to rent them to you!",
  remote_photo_url: 'https://res.cloudinary.com/discwhk4f/image/upload/v1551781659/wx0p5qp2g5obwlw8evau.jpg'
)

url_list_cars = [
  'https://res.cloudinary.com/discwhk4f/image/upload/v1551781659/wx0p5qp2g5obwlw8evau.jpg',
  'https://res.cloudinary.com/discwhk4f/image/upload/v1551790265/Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg.jpg',
  'https://res.cloudinary.com/discwhk4f/image/upload/v1551790411/new_alfa_romeo_8c_09.jpg',
  'https://res.cloudinary.com/discwhk4f/image/upload/v1551790484/ferrari-488-spider.jpg',
  'https://res.cloudinary.com/discwhk4f/image/upload/v1551790752/18nbgrzzzl56cjpg.jpg'
]

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
  car.user = user123
  car.remote_photo_url = url_list_cars.sample
  car.save!
  booking = Booking.new
  booking.start_date = Date.new(2018, 11, 20).to_time
  booking.end_date = Date.new(2018, 11, 27).to_time
  booking.user = user123
  booking.car = car
  booking.status = true
  booking.save!
  review = Review.new
  review.rating = Random.rand(0..5)
  review.description = "Good or bad I dont know"
  review.car = car
  review.booking = booking
  review.user = user123
  review.save
end


