class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :measurement_type
      t.integer :amount
      t.belongs_to :post

      t.timestamps null: false
    end
  end
end
