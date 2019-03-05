class CarsController < ApplicationController
  def landing
  end

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @reviews = Review.where(car_id: @car.id)
  end
end
