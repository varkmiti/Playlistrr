class Genre < ActiveRecord::Base
    attr_accessor :name

    has_many :songs
    belongs_to :users
    belongs_to :artists
end 