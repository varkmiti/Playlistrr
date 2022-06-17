class User < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs
    has_many :playlists, through: :songs
    has_many :parties, through: :songs
end 