class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :avatar
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
