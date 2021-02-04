class User < ActiveRecord::Base
    has_secure_password
    has_many :posts
    validates :username, uniqueness: true, length: {in: 5..20}, exclusion: {in: ["user"]}
    validates :password, length: {in: 8..30}
    validates :email, uniqueness: true
end
