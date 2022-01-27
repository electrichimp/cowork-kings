class Coworking < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  has_many_attached :photos

  # geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
