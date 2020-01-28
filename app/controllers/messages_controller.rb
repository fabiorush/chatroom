class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = Message.new(body: params[:body], user: current_user) if params[:body]
    if message.save
      ActionCable.server.broadcast "chatroom_channel", msg_line: message_render(message)
    end
  end

  private

  def message_render(msg)
    render partial: 'message', locals: {message: msg}
  end
end