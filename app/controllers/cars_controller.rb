class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @reviews = Review.where(car_id: @car.id)
  end

  def top
    cars = Car.all
    collect_cars = {}
    cars.each do |car|
       average =  car.reviews.inject(0){|sum,x| sum + x.rating } / car.reviews.length
       collect_cars[car.id] = average
    end
    top_hash = collect_cars.sort.reverse.first(5)
    @car_top = []
    top_hash.each do |top_car, value|
        @car_top << Car.find(top_car)
    end
  end
end
