class Conversation < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'

  validates_presence_of :user1_id, :user2_id

  # get conversation between two users
  def self.get_conversation(user1, user2)
    @conversation = Conversation.where("(user1_id = ? AND user2_id = ?) OR (user1_id = ? AND user2_id = ?)",
                                       user1, user2,
                                       user2, user1).first

    if @conversation.nil?
      @conversation = Conversation.new do |c|
        c.user1_id = user1
        c.user2_id = user2
        #TODO: catch ex if can't save to db
        c.save
      end
    end
    @conversation
  end

  def self.all_conversations_for(user)
    Conversation.where("user1_id = ? OR user2_id = ?", user, user)
  end

  # return user object. Maybe return just id?
  # something stupidly wrong
  def get_other_recipient(current_user)
    if self.user1 == current_user ? self.user1 : self.user2; end
  end

end
