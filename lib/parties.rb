def create_party
    puts "\n"
    puts "Let's find an existing party or create a new one! What is the name of your party?"
    puts "\n"
    name = gets.chomp
    @session_party = Party.find_or_create_by(name: name)
    puts "\n"
    puts "Awesome! Have fun adding songs to your party!"
end 

def view_songs_in_party
    puts "\n"
    puts Song.where(party_id: @session_party.id).map { |song| song.name }.uniq
end 

def view_user_parties
    puts @session_user.parties.map { |parties| parties.name }.uniq
end 

def update_party
    puts "What song would you like to move to a different party?"
    puts "\n"
    song_name = gets.chomp
    puts "\n"
    puts "What party would you like to move #{song_name} from?"
    puts "\n"
    from_party_name = gets.chomp
    puts "\n"
    puts "What party would you like to move #{song_name} to?"
    puts "\n"
    to_party_name = gets.chomp
    puts "\n"
    song = Song.where(name: song_name, playlist_id: @session_playlist.id, user_id: @session_user.id, party_id: Party.where(name: from_party_name).ids[0])
    song[0].update(party_id: Party.where(name: to_party_name).ids[0])
end 
