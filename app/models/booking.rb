class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
    # Added to validate method (TZ + SN)
  validates :car, presence: true
  validates :user, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validate :car_already_booked

  private


 def car_already_booked
  return if self.start_date.nil? || self.end_date.nil?

   if !self.car.bookings.where(start_date: self.start_date..self.end_date).empty? || !self.car.bookings.where(end_date: self.start_date..self.end_date).empty?
      errors.add(:start_date, "Car already booked for that period")
   end
 end

end


  # def overlapping
  #   if Booking.where('? < end_date and ? > start_date', self.start_date, self.end_date?).any?
  #     errors.add(:end_date, 'Car is already booked during this time period')
  #   end
  # end

