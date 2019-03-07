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
  # before_destroy :get_rid_of_reviews

  # def get_rid_of_reviews
  #     self.
  # end
end
