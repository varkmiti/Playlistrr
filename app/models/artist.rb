class Artist<ActiveRecord::Base
    has_many :songs
    has_many :users, through: :songs
    has_many :playlists, through: :songs
end