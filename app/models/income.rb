class Income < ApplicationRecord

  validates :money, presence: true
  validates :user_id, presence: true
  validates :month, presence: true
  validates :series, presence: true

  belongs_to :user
  has_one :blog, dependent: :destroy

end
