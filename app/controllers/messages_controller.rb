class MessagesController < ApplicationController
  before_action :require_user

  def create
    message_body = params[:body]
    if message_body
      Message.create(body: message_body, user: current_user)
    end
    redirect_to root_path
  end
end