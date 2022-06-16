class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :user
    belongs_to :playlist
    belongs_to :party
end