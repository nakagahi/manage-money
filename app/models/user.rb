class User < ApplicationRecord

  before_save {self.email = email.downcase}

  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}

  has_many :incomes, dependent: :destroy
  has_many :outputs, dependent: :destroy
  has_many :blogs, dependent: :destroy

  has_secure_password


end
