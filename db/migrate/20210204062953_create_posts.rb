class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :avatar
      t.belongs_to :user foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
