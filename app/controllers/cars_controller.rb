class CarsController < ApplicationController
  def landing
  end

  def index
    if params[:search]
      @cars = Car.where('name LIKE :search OR make LIKE :search OR location LIKE :search OR model LIKE :search', search: "%#{params[:search]}%" )
    else
      @cars = Car.all
    end

    # Item.where('game_name LIKE :search OR genre LIKE :search OR console LIKE :search', search: "%#{search}%")
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

  private

  def car_params
    params.require(:car).permit(:name, :make, :model, :location, :search)
  end
end
