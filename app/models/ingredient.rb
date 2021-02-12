class Ingredient < ActiveRecord::Base
    has_many :post_ingredients
    has_many :posts, through: :post_ingredients
end