require_relative 'photo_uploader'

class Post < ActiveRecord::Base
    
    belongs_to :user
    has_many :steps
    has_many :post_ingredients
    has_many :ingredients, through: :post_ingredients
    # validates :title, presence: true, uniqueness: true
    # validates :content, presence: true
    mount_uploader :avatar, PhotoUploader
    serialize :avatar, JSON
    
end
