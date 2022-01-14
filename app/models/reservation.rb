class Reservation < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :room

  def day_gap
    (self.end_date.to_date - self.start_date.to_date).to_i + 1
  end

  def total_price
    (self.room.price.to_i * self.people.to_i) * day_gap.to_i
  end

  #validate

  validates :people, presence: true
  validates :people, numericality: {greater_than: 0}
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_end_check

  def start_end_check
    if start_date != nil
    errors.add(:end_date, "は開始日より前の日付は登録できません。") unless
    self.start_date < self.end_date 
    end
    end
    
#  end

 validate :date_before_start


 def date_before_start
  if start_date != nil
   errors.add(:start_date, "は今日以降のものを選択してください") if
   start_date < Date.today
  end
 end
end
