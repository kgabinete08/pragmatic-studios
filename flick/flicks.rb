require_relative 'movie'
require_relative 'playlist'

movie1 = Movie.new("Skyfall", 100)
movie2 = Movie.new("Grease", 70)
movie3 = Movie.new("Batman", 85)

playlist1 = Playlist.new("Bob")
playlist1.add_movie(movie1)
playlist1.add_movie(movie2)
playlist1.add_movie(movie3)
playlist1.play(3)
playlist1.print_stats



