def search_song(song_name)
    puts RSpotify::Track.search("#{song_name}").flat_map { |art| [art.name, art.artists[0].name, art.album.name].join(" | ") }.first(10)
end