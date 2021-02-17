require_relative 'photo_uploader'

class Post < ActiveRecord::Base
    
    belongs_to :user
    has_many :steps
    has_many :ingredientposts
    has_many :ingredients, through: :ingredientposts
    # validates :title, presence: true, uniqueness: true
    # validates :content, presence: true
    mount_uploader :avatar, PhotoUploader
    serialize :avatar, JSON
    
end
