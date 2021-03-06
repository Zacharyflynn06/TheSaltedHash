class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.text :content
      t.belongs_to :post, foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
