class CreateIngredientPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_posts do |t|
      t.references :post
      t.references :ingredient
      
      t.integer :amount
      t.string :measurement_type

      t.timestamps null: false
    end
  end
end
