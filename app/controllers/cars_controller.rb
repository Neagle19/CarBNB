class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @reviews = Review.where(car_id: @car.id)
  end
# TZ added
  def new
    @car = Car.new
  end

    def create
    @car = Car.new car_params
    @car.user = current_user
    if @car.save!
      redirect_to car_path(@car)
    else
      render :new
    end
  end
# TZ private
  private

  def car_params
    params.require(:car).permit(:name, :location, :description, :capacity, :price, :user_id, :make, :model, :ac, :fuel, :consumption, :min_age, :year, :kilometers, :photo, :photo_cache)
  end
end

