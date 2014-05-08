class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.all_conversations_for current_user.id

  end

  def show
    # TODO: security checks if current user is participated in conv
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages

  end
end
