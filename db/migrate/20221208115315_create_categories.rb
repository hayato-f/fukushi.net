class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :post_id, null: false

      t.timestamps
    end
    add_foreign_key :categories, :posts
  end
end
