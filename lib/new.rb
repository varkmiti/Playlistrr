#top songs
#popular by genre
#popular artists
#popular albums

def new_albums
   puts  RSpotify::Album.new_releases.flat_map { |art| [art.name, art.artists[0].name].join(" | ") }.first(5)
end 

def new_for_you
   puts "Before we get started, let's get to know each other!"
   puts "Type in one of your favorite genres:"
   puts "\n"
   gen1 = gets.chomp
   puts "\n"
   puts "Cool! Let's get one more of your favorite genres:"
   puts "\n"
   gen2 = gets.chomp
   puts "Mmmmm... I think you might like these tracks!"
   puts "\n"
   puts RSpotify::Recommendations.generate(seed_genres: ["#{gen1}", "#{gen2}"]).tracks.flat_map { |art| [art.name, art.artists[0].name].join(" | ") }
end 