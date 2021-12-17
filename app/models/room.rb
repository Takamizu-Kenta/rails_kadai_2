class Room < ApplicationRecord

  has_many :reservations
  has_one_attached :room_image
end
