class RenameTypeColumnToOutputs < ActiveRecord::Migration[6.0]
  def change
    rename_column :outputs, :type, :series
  end
end
