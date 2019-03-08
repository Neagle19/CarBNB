class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  has_many :reviews, dependent: :destroy
    # Added to validate method (TZ + SN)
    validates :car, presence: true
    validates :user, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :status, presence: true
    validate :car_already_booked
    validate :check_price

    def calculate_price
      return self.car.price * (self.end_date.to_date - self.start_date.to_date + 1).to_i
    end

    private

    def check_price
      if self.user.balance < calculate_price
        errors.add(:start_date, "You broke dude")
      end
    end


    def car_already_booked
      return if self.start_date.nil? || self.end_date.nil?

      if !self.car.bookings.where(start_date: self.start_date..self.end_date).empty? || !self.car.bookings.where(end_date: self.start_date..self.end_date).empty?
        errors.add(:start_date, "Car already booked for that period")
      end
    end

  # before_destroy :get_rid_of_reviews

  # def get_rid_of_reviews
  #     self.
  # end
end

  # def overlapping
  #   if Booking.where('? < end_date and ? > start_date', self.start_date, self.end_date?).any?
  #     errors.add(:end_date, 'Car is already booked during this time period')
  #   end
  # end

