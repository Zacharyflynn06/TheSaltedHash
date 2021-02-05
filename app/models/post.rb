class Post < ActiveRecord::Base
    # has_secure_password
    belongs_to :user
    validates :title, presence: true, uniqueness: true
    validates :content, presence: true
end
