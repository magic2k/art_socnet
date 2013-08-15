class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :user_id
      t.string :name
      #t.string :city
      t.string :address
      t.string :metro
      t.string :tel
      t.string :workhours
      #t.string :email
      #t.string :avatar
      t.boolean :delivery
      t.boolean :parking
      t.boolean :wifi
      #t.boolean :banned
      t.integer :average_paybill
      t.integer :max_guests
      t.integer :halls_number
      t.text   :about

      t.timestamps
    end

    #add_index :restaurants, :name, unique: true
    add_index :restaurants, :user_id, unique: true
  end
end
