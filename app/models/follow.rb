class Follow < ActiveRecord::Base
  belongs_to :followed, :class_name => "User", :foreign_key => "followed"
  belongs_to :follower, :class_name => "User", :foreign_key => "follower"
end
