class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # Added to validate method (TZ + SN)
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :capacity, numericality: { only_integer: true }, presence: true
  validates :price, numericality: { only_integer: true }, presence: true
  validates :make, presence: true
  # validates :ac, presence: true
  validates :fuel, presence: true
  validates :consumption, presence: true
  validates :user, presence: true
  validates :min_age, presence: true
  validates :model, presence: true
  validates :kilometers, presence: true
  validates :year, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def gimme_average
    if self.reviews.any?
      self.reviews.inject(0){|sum,x| sum + x.rating } / self.reviews.length
    else
      0
    end
  end

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
  include PgSearch
  pg_search_scope :global_search,
  against: [:name, :make, :location, :model, :price, :year],
  associated_against: {
    user: [:first_name, :last_name]
  },
  using: {
    tsearch: { prefix: true }
  }

end
