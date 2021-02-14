class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.belongs_to :post
      t.timestamps null: false
    end
  end
end
