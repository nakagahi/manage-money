class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :money
      t.integer :user_id
      t.integer :month
      t.integer :species

      t.timestamps
    end
  end
end
