class User < ActiveRecord::Base

	has_secure_password
	
	has_many :tweets
	has_many :groups, :through => :groupuser
	has_many :followed, :class_name => "Follow", :foreign_key => "followed_id"
	has_many :follower, :class_name => "Follow", :foreign_key => "follower_id"
	has_many :directMessage, :class_name => "DirectMessage", :foreign_key => "user_id"

	validates :user_name, :password, :name, presence: true
	validates :user_name, uniqueness: true
	validates :user_name, :format => { :with => /\A(?=.*[a-z])[a-z\d]+\Z/i }


end