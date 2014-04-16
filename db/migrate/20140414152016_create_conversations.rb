class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      # t.integer :message_id
      t.timestamps
    end


    add_index :conversations, :sender_id
    add_index :conversations, :recipient_id
    add_index :conversations, [:sender_id, :recipient_id]
  end
end
