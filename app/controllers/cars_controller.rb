class CarsController < ApplicationController
  def landing
  end

  def index
    @cars = Car.where.not(latitude: nil, longitude: nil)



    if params[:search]
      @cars = Car.where('lower(name) LIKE :search OR lower(make) LIKE :search OR lower(location) LIKE :search OR lower(model) LIKE :search', search: "%#{params[:search].downcase}%" )
      collect_cars = {}
      @cars.each do |car|
        average =  car.gimme_average
        collect_cars[car.id] = [average, car]
        end
        @cars = collect_cars.sort_by { |_k, v| v[0] }.reverse
    else
      @cars = Car.all
      collect_cars = {}
      @cars.each do |car|
        average =  car.gimme_average
        collect_cars[car.id] = [average, car]
      end
      @cars = collect_cars.sort_by { |_k, v| v[0] }.reverse
    end
     @markers = @cars.where.not(latitude: nil, longitude: nil).map do |car|
      {
        lng: car.longitude,
        lat: car.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { car: car }),
        image_url: car.photo&.url
      }
        end
    # Item.where('game_name LIKE :search OR genre LIKE :search OR console LIKE :search', search: "%#{search}%")
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





  def top

    cars = Car.all
    collect_cars = {}
    cars.each do |car|
       average =  car.gimme_average
       collect_cars[car.id] = [average, car]
    end
    @car_top = collect_cars.sort_by { |_k, v| v[0] }.reverse.first(5)
  end

# TZ private
  private

  def car_params
    params.require(:car).permit(:name, :location, :description, :capacity, :price, :user_id, :make, :model, :ac, :fuel, :consumption, :min_age, :search, :year, :kilometers, :photo, :photo_cache)
  end
end

