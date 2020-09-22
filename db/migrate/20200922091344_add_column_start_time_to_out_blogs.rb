class AddColumnStartTimeToOutBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :out_blogs, :start_time, :datetime
  end
end
