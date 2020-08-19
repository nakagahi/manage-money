class RenameSpeciesToIncomes < ActiveRecord::Migration[6.0]
  def change
    rename_column :incomes, :species, :series
  end
end
