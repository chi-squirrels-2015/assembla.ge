class User < ActiveRecord::Base
    has_secure_password
    has_many :posts, foreign_key: :poster_id
    has_many :taggings, through: :posts
    has_many :tags, through: :taggings
    has_many :followings, foreign_key: :originator_id
    has_many :followings, foreign_key: :follower_id
    has_many :originators, through: :followings, source: :originator
    has_many :followers, through: :followings, source: :follower

    validates_associated :originators, :followers
end
