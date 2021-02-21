class Post < ActiveRecord::Base
    
    belongs_to :user
    has_many :steps
    has_many :ingredient_posts
    has_many :ingredients, through: :ingredient_posts

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
    
    mount_uploader :avatar, PhotoUploader
    serialize :avatar, JSON
    
end
