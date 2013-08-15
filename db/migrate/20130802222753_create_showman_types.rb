class CreateShowmanTypes < ActiveRecord::Migration
  def change
    create_table :showman_types do |t|
      t.integer :user_id
      t.boolean :emcee
      t.boolean :dj
      t.boolean :bartender
      t.boolean :illusionist
      t.boolean :tamada

      t.timestamps
    end

  end
end
