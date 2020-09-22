class OutBlog < ApplicationRecord

  belongs_to :user

  belongs_to :output, dependent: :destroy

end
