require_relative '../config/environment'

RSpotify.authenticate("18b7df05eba6475fa7cf513a461d6f60", "9658c23b6b614f70af47fa8f849c3174")

def terminate
    puts "\n"
    puts "Thank you for using Playlistrr!"
    puts "\n"
    exit(true)
end 

def return_home 
    puts "\n"
    puts "Would you like to search for something else?"
    puts "1. Yes"
    puts "2. No"
    puts "\n"
    return_or_exit = gets.chomp
    if return_or_exit == "1" or return_or_exit == "yes" or return_or_exit == "Yes"
        controls
    elsif return_or_exit == "2" or return_or_exit == "no" or return_or_exit == "No"
        terminate
    end 
end



def controls
    puts "\n"
    puts "What would you like to search for, #{@session_user.name}?"
    puts "1. Artists"
    puts "2. Albums"
    puts "3. Songs" 
    puts "5. Find New Music" 
    puts "6. View songs on playlist"
    puts "7. Change Playlist"
    puts "8. Create Party"
    puts "9. Quit Playlistrr"
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
    elsif choice == "6"
        show_songs_on_playlist

    elsif choice == "Songs" or choice == "songs" or choice == "3"
        puts "What song would you like to search for?"
        puts "\n"
        song_name = gets.chomp
        puts "\n"
        search_song(song_name)
        puts "\n"
        puts "Would you like to add the top result?"
        puts "\n"
        choice2 = gets.chomp
        puts "\n"
        if choice2 == "yes" or choice2 == "add song"
            add_song(song_name)
        end 

    elsif choice == "new music" or choice == "Find new" or choice == "5" or choice == "Find New Music" or choice == "Find new music" or choice == "find new music"
        puts "What would you like to see?"
        puts "1. New Albums"
        puts "2. New for You "
        puts "\n"
        choice1 = gets.chomp 
        puts "\n"
        if choice1 == "1" or choice1 == "New Albums" or choice1 == "New albums" or choice1 == "new albums"
            new_albums
        elsif choice1 == "2" or choice1 == "New for You" or choice1 == "new for you" or choice1 == "New for you"
            new_for_you
        end

    elsif choice == "7" or choice == "Create Playlist" or choice == "create playlist" or choice1 == "Create playlist"
        playlist_control_cycle

    elsif choice == "8" or choice == "Create party" or choice == "Create Party" or choice == "create party"
        create_party
    
    elsif choice == "9" or choice == "Quit" or choice == "quit"
        terminate
    else 
        puts "Sorry, looks like we can't find #{choice} for you. Let's try a different search:"
        select 
    end 
     
    return_home
end 



def playlist_control_cycle
    boot_into_playlist
    controls
end

sign_in
playlist_control_cycle