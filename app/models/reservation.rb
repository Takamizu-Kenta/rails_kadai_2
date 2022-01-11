class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room


  def day_gap
    (self.end_date.to_date - self.start_date.to_date).to_i + 1
  end

  def total_price
    (@room.room.price.to_i * self.people.to_i).to_i
  end
end
