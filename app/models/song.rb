class Song < ActiveRecord::Base
    belongs_to :genre
    belongs_to :artist
    belongs_to :user
end