class Room < ApplicationRecord

  has_many :reservations
  has_one_attached :room_image

  def self.search(search)
    if search
      Room.where(['content LIKE ?', "%#{search}%"])
    else
      Room.all
    end
  end
end
