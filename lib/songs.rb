def search_song(song_name)
    puts RSpotify::Track.search("#{song_name}").map { |track| [track.name, track.artists.map {|artist| artist.name}.join(", ")].join(" | ") }.first(10)
end

def add_song(song_name)
    if @session_party == nil
        puts "Would you like to join a party first?"
        puts "\n"
        choice = gets.chomp
        if choice == "no"
            Song.find_or_create_by(
                name: song_name, user_id: @session_user.id, 
                ob_id: RSpotify::Track.search("#{song_name}")[0].id,
                artist_id: RSpotify::Track.search("#{song_name}")[0].artists[0].id, 
                playlist_id: @session_playlist.id)
            Artist.find_or_create_by(art_id: RSpotify::Track.search("#{song_name}")[0].artists[0].id, 
            name: RSpotify::Track.search("#{song_name}")[0].artists[0].name)
        elsif choice == "yes"
            create_party
            Song.find_or_create_by(
                name: song_name, user_id: @session_user.id, 
                ob_id: RSpotify::Track.search("#{song_name}")[0].id,
                artist_id: RSpotify::Track.search("#{song_name}")[0].artists[0].id, 
                playlist_id: @session_playlist.id, 
                party_id: @session_party.id)
            Artist.find_or_create_by(id: RSpotify::Track.search("#{song_name}")[0].artists[0].id, 
                name: RSpotify::Track.search("#{song_name}")[0].artists[0].name)
        end 
    elsif @session_party != nil 
        Song.find_or_create_by(
                name: song_name, user_id: @session_user.id, 
                ob_id: RSpotify::Track.search("#{song_name}")[0].id,
                artist_id: RSpotify::Track.search("#{song_name}")[0].artists[0].id, 
                playlist_id: @session_playlist.id, 
                party_id: @session_party.id)
    end 
end 

def view_all_user_songs
    puts "\n"
    puts Song.where(user_id: @session_user.id).map {|song| song.name }.uniq
end 

