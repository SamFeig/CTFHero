class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sending_user_id"
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiving_user_id"
  acts_as_authentic
end
