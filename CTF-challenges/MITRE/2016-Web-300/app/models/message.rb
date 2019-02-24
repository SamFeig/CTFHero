class Message < ActiveRecord::Base
  belongs_to :receiving_user, :class_name => "User"
  belongs_to :sending_user, :class_name => "User"
  attr_accessible :body, :title, :receiving_user, :sending_user
end
