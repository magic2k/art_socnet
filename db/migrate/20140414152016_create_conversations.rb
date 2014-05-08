class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.timestamps
    end


    add_index :conversations, :user1_id
    add_index :conversations, :user2_id
    # add_index :conversations, [:sender_id, :recipient_id]
  end
end
