class CreateOutBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :out_blogs do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :money_id

      t.timestamps
    end
  end
end
