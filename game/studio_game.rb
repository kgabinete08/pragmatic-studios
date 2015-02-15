require_relative 'player'
require_relative 'game'

player1 = Player.new("Moe")
player2 = Player.new("Larry", 60)
player3 = Player.new("Curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

loop do
  puts "How many game rounds? ('quit' to exit)"
  answer = gets.chomp
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else 
    puts "Please enter a number or 'quit"
  end
end

knuckleheads.save_high_scores