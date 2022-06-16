class Party < ActiveRecord::Base
has_many :songs
has_many :users, through: :songs
end 