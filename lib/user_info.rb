def sign_in
    puts "\n"
    puts "Welcome to Playlistrr! How would you like to sign in?"
    puts "--------------------"
    puts "1. Sign in or up via name"
    puts "2. Sign in via Spotify"
    puts "\n"
    choice = gets.chomp
    puts "\n"
    if choice == "1" or choice == "name" or choice == "via Name" or choice == "via name" or choice == "Name"
        puts "What's your name?"
        puts "\n"
        choice1 = gets.chomp
        @session_user = User.find_or_create_by(name: choice1)
        puts "\n"
        puts "Howdy #{choice1}, welcome to Playlistrr!"
    elsif choice == "2" or choice == "Spotify" or choice == "spotify" or choice == "via Spotify"
        puts "under construction"
    end 
end 
