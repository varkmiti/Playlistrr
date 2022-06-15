class Song < ActiveRecord::Base
    attr_accessor :name

    belongs_to :genres
    belongs_to :artists
    belongs_to :users
end