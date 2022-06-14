class Genre < ActiveRecord::Base
    has_many :songs
    belongs_to :user
    belongs_to :artist
end 