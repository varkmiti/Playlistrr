def create_playlist
    puts "Let's find an existing playlist or create a new one! What is the name of your playlist?"
    puts "\n"
    name = gets.chomp
    puts "\n"
    @session_playlist = Playlist.find_or_create_by(name: name)
    puts "\n"
    puts "Awesome! Have fun adding songs to #{@session_playlist.name}!"
end 

def boot_into_playlist
    puts "Do you want you add songs to a playlist, or just look around?"
    puts "\n"
    puts "1. Add songs"
    puts "2. Just looking!"
    puts "\n"
    choice = gets.chomp
    puts "\n"
    if choice == "1" or choice == "add songs" or choice == "Add songs"
        create_playlist
    elsif choice == "2" or choice == "Just looking!" or choice == "just looking!" or choice == "just looking"
        puts "Have fun!"
        puts "\n"
    end 
end 

def show_songs_on_playlist
    puts "\n"
    puts Song.where(playlist_id: @session_playlist.id).map { |song| song.name }.uniq
end

def show_all_user_playlists
    puts "\n"
    puts @session_user.playlists.map {|playlist| playlist.name }.uniq
end 

def destroy_playlist(playlist_name)
    playlist_id = Playlist.where(name: playlist_name).ids
    Playlist.where(name: playlist_name).destroy_all
    Song.where(playlist_id: playlist_id).destroy_all
    puts "Gone!"
end 

def update_playlist
    puts "What song would you like to move to a different playlist?"
    puts "\n"
    song_name = gets.chomp
    puts "\n"
    puts "What playlist would you like to move #{song_name} to?"
    puts "\n"
    playlist_name = gets.chomp
    puts "\n"
    song = Song.where(name: song_name, playlist_id: @session_playlist.id, user_id: @session_user.id)
    song[0].update(playlist_id: Playlist.where(name: playlist_name).ids[0])
end 