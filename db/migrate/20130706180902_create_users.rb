class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :avatar
      #t.string :user_type
      t.string :city
      t.string :country
      t.string :password_digest
      t.string :skype
      t.string :vkontakte
      t.string :odkl
      t.string :twitter
      t.text   :languages
      #t.boolean :bartender
      #t.boolean :emcee
      #t.boolean :illusionist
      #t.boolean :dj
      t.boolean :guest
      t.boolean :restaurant
      t.boolean :showman
      t.boolean :admin,     default: false
      t.boolean :banned,    default: false
      t.text    :about

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
