class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @car = Car.find(params[:car_id])
  end

# We need to change User.last to current_user once we have a login

  def create
    @review = Review.new(check_review_params)
    @review.user = current_user
    @review.car = Car.find(params[:car_id])
    @review.booking = Booking.last
    # change the Booking.last to Booking.where(car_id: Car.find(params[:car_id]))[0] once we have bookings
    p "-"*40
    p @review
    if @review.save
      redirect_to car_path(@review.car.id)
    else
      render :new
    end
  end

  private

  def check_review_params
    params.require(:review).permit(:rating, :description)
  end
end
