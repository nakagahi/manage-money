class Rename < ActiveRecord::Migration[6.0]
  def change
    rename_column :blogs, :money_id, :income_id
  end
end
