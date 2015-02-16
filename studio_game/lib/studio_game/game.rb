require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

module StudioGame
  class Game
    def initialize(title)
      @title = title
      @players = []
    end

    def save_high_scores(to_file="high_scores.txt")
      File.open(to_file, "w") do |file|
        file.puts "#{@title} High Scores:"
        @players.sort.each do |player|
          file.puts high_score_entry(player)
        end
      end
    end

    def load_players(file_name)
      File.readlines(file_name).each do |line|
        add_player(Player.from_csv(line))
      end
    end

    def high_score_entry(player)
      formatted_name = player.name.ljust(20, '.')
      "#{formatted_name} #{player.score}"
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
        player.each_found_treasure do |treasure|
          puts "#{treasure.points} total #{treasure.name} points"
        end
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
        puts high_score_entry(player)
      end
    end
  end
end