class CreateRestaurantTypes < ActiveRecord::Migration
  def change
    create_table :restaurant_types do |t|

      t.integer :restaurant_id
      t.boolean :bar
      t.boolean :pub
      t.boolean :pizza
      t.boolean :barbeque
      t.boolean :cafe
      t.boolean :steakhouse
      t.boolean :sushi_bar
      t.boolean :vegan_menu
      t.boolean :food_court
      t.boolean :art_cafe
      t.boolean :grand_cafe

      t.timestamps
    end

    add_index :restaurant_types, :restaurant_id, unique: true
  end
end
