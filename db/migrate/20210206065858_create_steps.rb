class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.text :content
      t.string :avatar
      t.belongs_to :post

      t.timestamps null: false
    end
  end
end
