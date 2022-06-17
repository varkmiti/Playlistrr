class Playlist < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs

    has_one :user, through: :song 
end 