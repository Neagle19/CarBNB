class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # Added to validate method (TZ + SN)
  validates :name, presence: true
  # validates :location, presence: true
  # validates :description, presence: true
  # validates :capacity, numericality: { only_integer: true }, presence: true
  # validates :price, numericality: { only_integer: true }, presence: true
  # validates :make, presence: true
  # validates :ac, presence: true
  # validates :fuel, presence: true
  # validates :consumption, presence: true
  # validates :user, presence: true
  # validates :min_age, presence: true
  # validates :model, presence: true
  # validates :kilometers, presence: true
  # validates :year, presence: true
  mount_uploader :photo, PhotoUploader
end
