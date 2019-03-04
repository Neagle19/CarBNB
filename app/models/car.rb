class Car < ApplicationRecord
  belongs_to :user
  # Added to validate method (TZ + SN)
  validates :make, presence: true
  validates :user, presence: true
  validates :min_age, presence: true
  validates :model, presence: true
  validates :kilometers, presence: true
end
