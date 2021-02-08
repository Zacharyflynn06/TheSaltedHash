class AddIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.text :content
      t.belongs_to :post

      t.timestamps null: false
    end
  end
end
