class CreatePostIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :post_ingredients do |t|
      t.integer :amount
      t.string :measurement_type
      t.belongs_to :post
      t.belongs_to :ingredient

      t.timestamps null: false
    end
  end
end
