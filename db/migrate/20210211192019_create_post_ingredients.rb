class CreatePostIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :post_ingredients do |t|
      t.integer :amount
      t.string :measurement_type
      t.integer :post_id
      t.integer :ingredient_id

      t.timestamps null: false
    end
  end
end
