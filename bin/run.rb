require_relative '../config/environment'

RSpotify.authenticate("18b7df05eba6475fa7cf513a461d6f60", "9658c23b6b614f70af47fa8f849c3174")

def album_search_by_artist_name(artist_name)
    puts RSpotify::Artist.search("#{artist_name}").map { |art| art.name } 

    puts "\n"
    puts "Which #{artist_name}? If there are multiple artists with the same name, your search will return the most popular artist with that name."

    real_name = gets.chomp
    most_pop =  RSpotify::Artist.search("#{artist_name}").map { |art| art.popularity }.max {|art1, art2| art1 <=> art2 }
    art_name = RSpotify::Artist.search("#{artist_name}").filter { |art| art.popularity == most_pop }[0].name
    puts RSpotify::Artist.search("#{art_name}")[0].albums.map { |alb| alb.name }.uniq
    # puts RSpotify::Artist.search("#{artist_name}").first.albums.map { |alb| alb.name }.uniq
end 

def songs_by_album(album)
    puts RSpotify::Album.search("#{album}").map { |art| art.name } 

    puts "\n"
    puts "Which '#{album}'? If there are multiple albums with the same name, your search will return the most popular album with that name."

    real_name = gets.chomp
    most_pop =  RSpotify::Album.search("#{real_name}").map { |art| art.popularity }.max {|art1, art2| art1 <=> art2 }
    art_name = RSpotify::Album.search("#{real_name}").filter { |art| art.popularity == most_pop }[0].name
    puts RSpotify::Album.search("#{art_name}")[0].tracks.map { |alb| alb.name }.uniq



end 

puts "What album would you like to search for?"
# puts "What artist would you like to search for?"

name = gets.chomp

# album_search_by_artist_name(name)

songs_by_album(name)


puts "\n"
puts "HELLO WORLD"
