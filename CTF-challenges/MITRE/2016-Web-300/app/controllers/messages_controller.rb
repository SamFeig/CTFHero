class MessagesController < ApplicationController
	before_filter :require_user
  def index
  	@messages = current_user.received_messages
  end
end
