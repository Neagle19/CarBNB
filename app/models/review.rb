class Review < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :booking
  # Added to validate method (TZ + SN)
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :car, presence: true
  validates :user, presence: true
  validates :description, presence: true
end
