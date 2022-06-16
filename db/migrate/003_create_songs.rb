class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.belongs_to :artist
      t.belongs_to :user
      t.string :ob_id
      t.belongs_to :playlist
      t.belongs_to :party
    end
  end
end
