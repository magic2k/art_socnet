class MessagesController < ApplicationController

  def index

  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @recipient_id = params[:user_id]
    @conversation = Conversation.get_conversation(current_user.id, @recipient_id)
    @message.sender_id = current_user.id
    @message.recipient_id = @recipient_id
    @message.conversation = @conversation
    if @message.save
      flash[:success] = "msg sent"
      redirect_to user_path(params[:user_id])
    else
      flash[:error] = "hui"
      render 'new'
    end
  end

  def show

  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

end
