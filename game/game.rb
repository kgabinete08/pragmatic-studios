require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def total_points
      @players.reduce(0) { |sum, player| sum + player.points }
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{@title}:"

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"

    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    @players.each do |player|
      1.upto(rounds) do |round|
      puts "\nRound #{round}:"
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end

    puts "\n#{total_points} total points from treasures found."

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