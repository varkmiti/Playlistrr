def create_party
    puts "Let's find an existing party or create a new one! Whst is the name of your party?"
    puts "\n"
    name = gets.chomp
    @session_party = Party.find_or_create_by(name: name)
    puts "\n"
    puts "Awesome! Have fun adding songs to your party!"
end 
    