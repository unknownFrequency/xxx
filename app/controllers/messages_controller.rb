class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    
  end

  def create
   # @message = Message.new
   # @message = message_params
   @message = current_user.messages.new(message_params)

    if @message.save
      redirect_to root_path
    else
      render 'new', notice: @message.errors.full_messages.first
    end
   
  end

  def new
    @message = Message.new
  end

  private
  def message_params
    params.require(:message).permit(:receiver_id, :message)
  end

  def set_user
    @user = current_user
  end
end
