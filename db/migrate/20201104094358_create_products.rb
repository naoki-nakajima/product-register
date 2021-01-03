class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image
      t.string :text
      t.integer :user_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
