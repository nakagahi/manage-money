class Outputs < ActiveRecord::Migration[6.0]
  def change
    rename_column :outputs, :species, :series
  end
end
