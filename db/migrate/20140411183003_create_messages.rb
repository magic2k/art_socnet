class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.string :content

      t.timestamps
    end

    add_index :messages, :conversation_id
  end
end
