def search_song(song_name)
    puts RSpotify::Track.search("#{song_name}").map { |track| [track.name, track.artists.map {|artist| artist.name}.join(", ")].join(" | ") }.first(10)
end