class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.integer :restaurant_id
      t.boolean :european
      t.boolean :chinese
      t.boolean :author
      t.boolean :azerbaijanian
      t.boolean :armenian
      t.boolean :vietnam
      t.boolean :thai
      t.boolean :indian
      t.boolean :indonesian
      t.boolean :japan
      t.boolean :international
      t.boolean :mexican
      t.boolean :uzbekian
      t.boolean :germanian
      t.boolean :american
      t.boolean :french
      t.boolean :italian
      t.boolean :mediterranian
      t.boolean :ukrainian
      t.boolean :czech
      t.boolean :turkish
      t.boolean :georgian
      t.boolean :arab
      t.boolean :korean
      t.boolean :panazian

      t.timestamps
    end

    add_index :cuisines, :restaurant_id, unique: true
  end
end
