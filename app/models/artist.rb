class Artist<ActiveRecord::Base
    attr_accessor :name

    has_many :songs
    has_many :genres, through: :songs
    has_many :users, through: :songs
    has_many :playlists, through: :songs
        
end