class Blog < ApplicationRecord

  belongs_to :user

  belongs_to :income, dependent: :destroy

end
