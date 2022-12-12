class CreateMyCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :my_categories do |t|
      t.string :name, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
    add_foreign_key :my_categories, :posts
  end
end
