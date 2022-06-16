class CreatePlaylist < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t| 
      t.string :name
      t.string :pl_id
    end
  end
end
