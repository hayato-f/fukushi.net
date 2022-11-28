class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps
      t.index [:user_id, :post_id], unique: true
    end
    add_foreign_key :favorites, :users
    add_foreign_key :favorites, :posts
  end
end
