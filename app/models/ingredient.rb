class Ingredient < ActiveRecord::Base

    has_many :ingredient_posts
    has_many :posts, through: :ingredient_posts
    
end