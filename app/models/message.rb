class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates_presence_of :content, :conversation_id
  validates_presence_of :sender_id, :recipient_id
  validates_length_of :content, maximum: 250
end
