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
    puts Song.where(playlist_id: @session_party.id).map { |song| song.name }
end 

def view_user_parties
    puts @session_user.parties.map { |parties| parties.name }.uniq
end 

def update_party
end 
