def album_search_by_artist_name(artist_name)
    if RSpotify::Artist.search("#{artist_name}").map { |art| art.name }.count >= 2
        puts RSpotify::Artist.search("#{artist_name}").map { |art| art.name }.uniq

        puts "\n"
        puts "Which #{artist_name}? If there are multiple artists with the same name, your search will return the most popular artist with that name."

        real_name = gets.chomp
        puts "\n"
        puts "Albums by #{real_name}:"
        most_pop =  RSpotify::Artist.search("#{artist_name}").map { |art| art.popularity }.max {|art1, art2| art1 <=> art2 }
        art_name = RSpotify::Artist.search("#{artist_name}").filter { |art| art.popularity == most_pop }[0].name
        puts RSpotify::Artist.search("#{art_name}")[0].albums.map { |alb| alb.name }.uniq

    elsif RSpotify::Artist.search("#{artist_name}").map { |art| art.name }.count == 1
        RSpotify::Artist.search("#{artist_name}")[0].albums.map { |alb| alb.name }.uniq
    end  
end 