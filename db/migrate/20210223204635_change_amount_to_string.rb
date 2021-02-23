class ChangeAmountToString < ActiveRecord::Migration[5.2]
  def change
    change_column :ingredient_posts, :amount, :string
  end
end
