class User < ActiveRecord::Base
    has_secure_password
    has_many :posts, foreign_key: :poster_id
    has_many :taggings, through: :posts
    has_many :tags, through: :taggings

<<<<<<< HEAD
    validates_associated :originators, :followers
=======
    has_many :follower_links, class_name: "Following", foreign_key: :originator_id
    has_many :following_links, class_name: "Following", foreign_key: :follower_id
    # has_many :followings, foreign_key: :originator_id
    # has_many :followings, foreign_key: :follower_id
    # These were overwriting each-other
    has_many :originators, through: :following_links, source: :originator
    has_many :followers, through: :follower_links, source: :follower

    validates_associated :originators, :followers

    validates :username, uniqueness: true
    validates :email,    uniqueness: true

  def self.authenticate(params)
    find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
  end
>>>>>>> 2e1fa95b896416309da27eb0a51f91c0c6f3e81e
end
