class Review < ApplicationRecord
  belongs_to :user
  belongs_to :coworking

  validates :rating, { inclusion: { in: 0..5 } }
end
