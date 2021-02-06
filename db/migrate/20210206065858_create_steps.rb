class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :content
      t.avatar :picture

      t.timestamps null: false
    end
  end
end
