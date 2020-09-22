class RenameToOut < ActiveRecord::Migration[6.0]
  def change
    rename_column :out_blogs, :money_id, :output_id
  end
end
