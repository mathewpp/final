class DirectMessage < ActiveRecord::Base
  
  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'

  validates :receiver_id, :message, presence: true
  attr_accessor :user_name

end