class Message < ActiveRecord::Base
  belongs_to :conversation

  # validates_presence_of :content, :conversation_id
  validates_length_of :content, maximum: 250
end
