class MessagesController < ApplicationController

  def index

  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @receiver_id = params[:user_id]
    @conversation = get_conversation
    # @message.sender_id = User.find(current_user.id)
    # @message.receiver_id = @receiver_id
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

  def get_conversation
    @conversation = Conversation.find_or_create_by(sender_id: current_user.id, receiver_id: @receiver_id.to_i)

    # if @conversation.nil?
    #   Conversation.new do |c|
    #     c.sender_id = current_user.id
    #     c.receiver_id = @receiver_id
    #     #TODO: catch ex if can't save to db
    #     c.save
    #   end
    # end

    @conversation
  end

end
