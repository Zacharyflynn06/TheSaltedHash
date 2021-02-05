class User < ActiveRecord::Base
    has_secure_password
    has_many :posts
    validates :username, uniqueness: true, length: {in: 2..20}, exclusion: {in: ["user"]}
    validates :password, length: {in:2..30}, confirmation: true
    validates :email, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
end
