class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
    # Added to validate method (TZ + SN)
  validates :make, presence: true
  validates :user, presence: true
end
