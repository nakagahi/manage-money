class Output < ApplicationRecord

  validates :money, presence: true
  validates :user_id, presence: true
  validates :month, presence: true
  validates :type, presence: true
end
