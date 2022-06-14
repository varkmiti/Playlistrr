#top songs
#popular by genre
#popular artists
#popular albums

def new_albums
   puts  RSpotify::Album.new_releases.flat_map { |art| [art.name, art.artists[0].name].join(" | ") }.first(5)
end 

def new_artists
   puts RSpotify::Artists.new
end 

def get_recs
end 

def new_
end 