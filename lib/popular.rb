def most_popular_artists
    puts "Here are the most popular artists on Playlistrr:"
    puts "--------------------"
    puts RSpotify::Artist.search(artist, limit = 20)
end 