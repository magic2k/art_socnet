class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.integer :user_id
      t.boolean :emcee
      t.boolean :dj
      t.boolean :bartender
      t.boolean :illusionist
      t.boolean :tamada

      t.timestamps
    end

    add_index :user_types, :user_id, unique: true
  end
end
