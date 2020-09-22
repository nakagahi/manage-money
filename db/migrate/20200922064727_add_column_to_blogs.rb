class AddColumnToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :income_id, :integer
    add_column :blogs, :output_id, :integer
  end
end
