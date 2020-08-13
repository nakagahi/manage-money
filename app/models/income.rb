class Income < ApplicationRecord

  validates :money, presence: true
  validates :user_id, presence: true
  validates :month, presence: true
  validates :series, presence: true

end
