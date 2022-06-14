class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table do |t|
      t.string :name
    end
  end
end
