class User < ActiveRecord::Base

	validates :user_name, :password, :name, presence: true
	validates :user_name, uniqueness: true

end
