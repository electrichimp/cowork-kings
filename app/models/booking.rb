class Booking < ApplicationRecord
  belongs_to :coworking
  belongs_to :user
end
