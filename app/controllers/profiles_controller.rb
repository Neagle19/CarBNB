class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cars = Car.where(user_id: @user.id)
    @bookings = Booking.where(user_id: @user.id)
  end

  def add50
    p "im in add50"
    current_user.balance += 50
    current_user.save
    redirect_to profile_path(current_user.id)
  end
end
