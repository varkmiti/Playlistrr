# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 5) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "art_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.string "pl_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.integer "artist_id"
    t.integer "user_id"
    t.string "ob_id"
    t.integer "playlist_id"
    t.integer "party_id"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["party_id"], name: "index_songs_on_party_id"
    t.index ["playlist_id"], name: "index_songs_on_playlist_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
