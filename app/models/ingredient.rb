class Ingredient < ActiveRecord::Base

    has_many :ingredientposts
    has_many :posts, through: :ingredientposts
    
end