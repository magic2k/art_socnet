class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :user_type
      t.string :city
      t.string :country
      t.text :languages
      t.boolean :bartender
      t.boolean :emcee
      t.boolean :illusionist
      t.boolean :dj
      t.boolean :guest
      t.boolean :admin

      t.timestamps
    end


    add_index :users, :email, unique: true
  end
end
