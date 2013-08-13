class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :firstname
      t.string :lastname
      t.string :avatar
      t.string :city
      t.string :country
      t.string :password_digest
      t.string :skype
      t.string :vkontakte
      t.string :odkl
      t.string :twitter
      t.string :usr_type
      t.text   :languages
      #t.boolean :guest,      default: false
      #t.boolean :restaurant, default: false
      #t.boolean :showman,    default: false
      t.boolean :admin,      default: false
      t.boolean :banned,     default: false
      t.boolean :completed,     default: false
      t.text    :about

      t.timestamps
    end

  end
end
