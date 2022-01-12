class Room < ApplicationRecord

  has_many :reservations
  has_one_attached :room_image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true

  def self.search(search)
    if search
      Room.where(['content LIKE ?', "%#{search}%"])
    else
      Room.all
    end
  end

end
