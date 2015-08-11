class DirectMessage < ActiveRecord::Base
  belongs_to :sender_id, :class_name => "User", :foreign_key => "sender_id"
  belongs_to :receiver_id, :class_name => "User", :foreign_key => "receiver_id"

  attr_accessor :user_name

end