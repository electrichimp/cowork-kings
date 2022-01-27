class Coworking < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  has_many_attached :photos
  has_many :reviews, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address_and_description,
    against: [ :name, :address, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
