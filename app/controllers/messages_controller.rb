class MessagesController < ApplicationController

  def index

  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = User.find(current_user.id)
    @message.receiver_id = params[:user_id]
    if @message.save
      flash[:success] = "msg sent"
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = "hui"
      render 'new'
    end
  end

  def show

  end

  private
  def message_params
    params.require(:message).permit(:sender, :receiver, :content)
  end

end
