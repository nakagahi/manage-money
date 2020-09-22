class Output < ApplicationRecord

  validates :money, presence: true
  validates :user_id, presence: true
  validates :month, presence: true
  validates :series, presence: true

  belongs_to :user
  has_one :out_blog, dependent: :destroy
end
