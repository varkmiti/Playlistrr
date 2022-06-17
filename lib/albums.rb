def songs_by_album(album)
    if RSpotify::Album.search("#{album}").map { |art| art.name }.count != 1
        puts RSpotify::Album.search("#{album}").map { |track| [track.name, track.artists.map {|artist| artist.name}.join(", ")].join(" | ") }.uniq.first(5)
        
        puts "\n"
        puts "Which '#{album}'? If there are multiple albums with the same name, your search will return the most popular album with that name."

        real_name = gets.chomp
        puts "\n"
        puts "Songs on #{real_name}:"
        most_pop =  RSpotify::Album.search("#{real_name}").map { |art| art.popularity }.max {|art1, art2| art1 <=> art2 }
        art_name = RSpotify::Album.search("#{real_name}").filter { |art| art.popularity == most_pop }[0].name
        puts RSpotify::Album.search("#{art_name}")[0].tracks.map { |alb| alb.name }.uniq

    elsif RSpotify::Album.search("#{album}").map { |art| art.name }.count == 1
        puts RSpotify::Album.search("#{album}")[0].tracks.map { |alb| alb.name }.uniq
    end 
end 

def all_user_albums
    puts "\n"
    array = @session_user.songs.map { |song| song.ob_id }.uniq.to_a
    puts array.map {|song| RSpotify::Track.find("#{song}") }.map {|song_obj| song_obj.album }.map { |album| album.name }

end 