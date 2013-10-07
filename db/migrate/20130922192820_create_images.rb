class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :album_id
      t.string :comment
      t.attachment :image

      t.timestamps
    end

    add_index :images, :album_id
  end
end
