class RemoveColumnOutputId < ActiveRecord::Migration[6.0]
  def change
    remove_column :blogs, :output_id, :integer
  end
end
