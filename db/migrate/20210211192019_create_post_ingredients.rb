class CreatePostIngredients < ActiveRecord::Migration[5.2]
  def change
    create_join_table :posts, :ingredients do |t|
      t.index :post_id
      t.index :category_id
      
      t.integer :amount
      t.string :measurement_type
      t.timestamps null: false
    end
  end
end
