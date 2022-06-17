class Playlist < ActiveRecord::Base
    has_many :songs
    has_many :users, through: :songs
    has_many :artists, through: :songs
end 