class RenameIncomeIdColumnToBlogs < ActiveRecord::Migration[6.0]
  def change
    rename_column :blogs, :income_id, :money_id
  end
end
