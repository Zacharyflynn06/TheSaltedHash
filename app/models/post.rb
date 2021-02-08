require_relative 'photo_uploader'

class Post < ActiveRecord::Base
    # has_secure_password
    mount_uploader :avatar, PhotoUploader
    belongs_to :user
    has_many :steps
    validates :title, presence: true, uniqueness: true
    validates :content, presence: true
    
end
