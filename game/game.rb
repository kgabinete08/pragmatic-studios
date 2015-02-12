require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{@title}:"

    @players.each do |player|
      1.upto(rounds) do |round|
      puts "\nRound #{round}:"
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    puts "\n#{@title} Stats:"

    strong, wimpy = @players.partition { |player| player.strong? }

    puts "\n#{strong.length} Strong players:"
    puts strong

    puts "\n#{wimpy.length} Wimpy players:"
    puts wimpy

    puts "\n#{@title} High Scores:"

    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end
  end
end