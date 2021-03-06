# require_relative 'photo_uploader'  

class User < ActiveRecord::Base
    has_secure_password
    has_many :posts
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true,uniqueness: true, length: {in: 2..20}, exclusion: {in: ["user"]}
    validates :password,  length: {in:4..30}, confirmation: true, on: :create
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}

    mount_uploader :avatar, PhotoUploader
    serialize :avatar, JSON
end