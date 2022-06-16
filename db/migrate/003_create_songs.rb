class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist_id
      t.integer :user_id
      t.string :ob_id
      t.string :playlist_id
      t.integer :party_id
    end
  end
end
