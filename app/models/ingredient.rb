class Ingredient < ActiveRecord::Base
    has_many :post_ingredients
    has many :posts, through: :recipe_ingredients
end