class PostIngredients < ActiveRecord::Base

    belongs_to :post
    belongs_to :ingredient

end