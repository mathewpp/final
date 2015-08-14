class User < ActiveRecord::Base

	has_secure_password
	
	has_many :tweets
	has_many :followed, :class_name => "Follow", :foreign_key => "followed"
	has_many :follower, :class_name => "Follow", :foreign_key => "follower"
	validates :user_name, :password, :name, presence: true
	validates :user_name, uniqueness: true

end
