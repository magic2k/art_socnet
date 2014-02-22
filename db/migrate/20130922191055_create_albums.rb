class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :user_id
      # t.integer :image_id
      t.integer :cover_id
      t.string	:album_name

      t.timestamps
    end

    add_index :albums, [:user_id, :id]
  end
end
