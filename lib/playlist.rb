def create_playlist
    puts "Let's find an existing playlist or create a new one! What is the name of your playlist?"
    puts "\n"
    name = gets.chomp
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
    binding.pry
    puts @session_user.playlists
end 