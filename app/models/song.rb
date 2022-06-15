class Song < ActiveRecord::Base
    belongs_to :genres
    belongs_to :artists
    belongs_to :users
end