class AddIndexToShowmanTypes < ActiveRecord::Migration
  def change
    add_index :showman_types, :user_id, unique: true
  end
end
