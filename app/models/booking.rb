class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
    # Added to validate method (TZ + SN)
  validates :car, presence: true
  validates :user, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
end
