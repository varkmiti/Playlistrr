require_relative '../config/environment'

RSpotify.authenticate("18b7df05eba6475fa7cf513a461d6f60", "9658c23b6b614f70af47fa8f849c3174")

puts "Welcome to Playlistrr! What would you like to search for?"
puts "1. Artists"
puts "2. Albums"
puts "3. Songs" 
puts "4. Popularity" #yet to be built out 
puts "5. Find New Music" #yet to be built out 
puts "\n"
choice = gets.chomp
puts "\n"

if choice == "Artists" or choice == "artists" or choice == "1"
    puts "What artist would you like to search for?"
    puts "\n"
    artist_name = gets.chomp 
    puts "\n"
    album_search_by_artist_name(artist_name)

elsif choice == "Albums" or choice == "ablums" or choice == "2"
    puts "What album would you like to search for?"
    puts "\n"
    album_name = gets.chomp
    puts "\n"
    songs_by_album(album_name)
elsif choice == "Songs" or choice == "songs" or choice == "3"
    puts "What song would you like to search for?"
    puts "\n"
    song_name = gets.chomp
    puts "\n"
    search_song(song_name)
end 


puts "\n"
puts "HELLO WORLD"
