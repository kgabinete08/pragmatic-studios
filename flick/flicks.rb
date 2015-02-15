require_relative 'movie'
require_relative 'playlist'

movie1 = Movie.new("Skyfall", 100)
movie2 = Movie.new("Grease", 70)
movie3 = Movie.new("Batman", 85)

playlist1 = Playlist.new("Bob")
playlist1.load(ARGV.shift || "movies.csv")

loop do
  puts "\nHow many viewings? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    playlist1.play(answer.to_i)
  when 'quit', 'exit'
    playlist1.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

playlist1.save
