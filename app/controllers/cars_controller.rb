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
       collect_cars[car.id] = [average, car]
    end
    @car_top = collect_cars.sort_by { |_k, v| v[0] }.reverse.first(5)

  end
end
