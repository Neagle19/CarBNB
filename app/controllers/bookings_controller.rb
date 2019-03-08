class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @car = Car.find params[:car_id]
    @booking = Booking.new
  end

  def create
    @car = Car.find params[:car_id]
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    @booking.status = 'just created'
    if @booking.save
      redirect_to car_booking_accepted_path(@car, @booking)
    else
      render :new
      # redirect_to car_denied_path(@car)
    end
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save(booking_params)
      redirect_to @booking
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to car_bookings_path
  end

  def accepted
    set_booking2
  end

  # def denied
  #   set_booking3
  # end

  private

  def booking_params
    params.require(:booking).permit(:car, :user, :start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_booking2
    @booking = Booking.find(params[:booking_id])
    @car = Car.find(params[:car_id])
  end

  # def set_booking3
  #   @car = Car.find(params[:car_id])
  # end
end
