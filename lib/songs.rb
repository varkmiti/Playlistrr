def search_song(song_name)
    puts RSpotify::Track.search("#{song_name}").map.with_index(1) { |track, index| [index, track.name, track.artists.map {|artist| artist.name}.join(", ")].join(" | ") }.first(10)
end

def song_by_id(song_name, index)
    if @session_party == nil
        puts "Would you like to join a party first?"
        puts "\n"
        choice = gets.chomp
        if choice == "no"
            artist_create_helper(song_name)
            Song.find_or_create_by(name: RSpotify::Track.search("#{song_name}")[(index.to_i-1)].name,
            user_id: @session_user.id, 
            ob_id: RSpotify::Track.search("#{song_name}")[(index.to_i-1)].id,
            artist_id: Artist.find_or_create_by(art_id: RSpotify::Track.search("#{song_name}")[(index.to_i-1)].artists[0].id).id,
            playlist_id: @session_playlist.id)
        elsif choice == "yes"
            create_party
            artist_create_helper(song_name)
            Song.find_or_create_by(name: RSpotify::Track.search("#{song_name}")[(index.to_i-1)].name,
            user_id: @session_user.id, 
            ob_id: RSpotify::Track.search("#{song_name}")[(index.to_i-1)].id,
            artist_id: Artist.find_or_create_by(art_id: RSpotify::Track.search("#{song_name}")[(index.to_i-1)].artists[0].id).id,
            playlist_id: @session_playlist.id,
            party_id: @session_party.id)
        end
    elsif @session_party != nil 
        artist_create_helper(song_name)
        Song.find_or_create_by(name: RSpotify::Track.search("#{song_name}")[(index.to_i-1)].name,
        user_id: @session_user.id, 
        ob_id: RSpotify::Track.search("#{song_name}")[(index.to_i-1)].id,
        artist_id: Artist.find_or_create_by(art_id: RSpotify::Track.search("#{song_name}")[(index.to_i-1)].artists[0].id).id,
        playlist_id: @session_playlist.id,
        party_id: @session_party.id)
    end 
end 

def add_song(song_name)
    if @session_party == nil
        puts "Would you like to join a party first?"
        puts "\n"
        choice = gets.chomp
        if choice == "no"
            artist_create_helper(song_name)
            Song.find_or_create_by(
                name: RSpotify::Track.search("#{song_name}")[0].name, user_id: @session_user.id, 
                ob_id: RSpotify::Track.search("#{song_name}")[0].id,
                artist_id: Artist.find_or_create_by(art_id: RSpotify::Track.search("#{song_name}")[0].artists[0].id).id, 
                playlist_id: @session_playlist.id)
        elsif choice == "yes"
            create_party
            artist_create_helper(song_name)
            Song.find_or_create_by(
                name: RSpotify::Track.search("#{song_name}")[0].name, user_id: @session_user.id, 
                ob_id: RSpotify::Track.search("#{song_name}")[0].id,
                artist_id: Artist.find_or_create_by(art_id: RSpotify::Track.search("#{song_name}")[0].artists[0].id).id, 
                playlist_id: @session_playlist.id, 
                party_id: @session_party.id)
        end 
    elsif @session_party != nil 
        artist_create_helper(song_name)
        Song.find_or_create_by(
            name: RSpotify::Track.search("#{song_name}")[0].name, user_id: @session_user.id, 
            ob_id: RSpotify::Track.search("#{song_name}")[0].id,
            artist_id: Artist.find_or_create_by(art_id: RSpotify::Track.search("#{song_name}")[0].artists[0].id).id, 
            playlist_id: @session_playlist.id, 
            party_id: @session_party.id)
    end 
end 

def artist_create_helper(song_name)
    Artist.find_or_create_by(art_id: RSpotify::Track.search("#{song_name}")[0].artists[0].id, 
    name: RSpotify::Track.search("#{song_name}")[0].artists[0].name)
end 

def view_all_user_songs
    puts "\n"
    puts User.find(@session_user.id).songs.map { |track| [track.name, Artist.find(track.artist_id).name].join(" | ") }.uniq
end 
def destroy_song(song_name)
    puts "How would you like to delete a song?"
    puts "1. Delete song from current playlist #{@session_playlist.name}"
    puts "2. Delete song from all user objects"
    puts "3. Back"
    puts "\n"
    choice3 = gets.chomp
    puts "\n"
    if choice3 == "1" or choice3 == "delete song from a playlist"
        Song.where(name: RSpotify::Track.search(song_name)[0].name, playlist_id: @session_playlist.id, user_id: @session_user.id).destroy_all
        puts "Gone!"
    elsif choice3 == "2" or choice3 == "delete song from all user objects"
        Song.where(name: RSpotify::Track.search(song_name)[0].name, user_id: @session_user.id).destroy_all
        puts "Gone!"
    elsif choice3 == "3" or choice3 == "Back" or choice3 == "back"
        controls
    end 
end 
