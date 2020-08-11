class CreateMonths < ActiveRecord::Migration[6.0]
  def change
    create_table :months do |t|
      t.integer :money
      t.integer :month

      t.timestamps
    end
  end
end
