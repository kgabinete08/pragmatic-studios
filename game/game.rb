require_relative 'player'
require_relative 'die'

class Game
  def initialize(name)
    @name = name
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.length} players in #{@name}:"

    @players.each do |player|
      puts player
    end

    @players.each do |player|
      die = Die.new
      
      case die.roll
      when 5..6
        player.w00t
      when 3..4
        puts "#{player.name} was skipped."
      else
        player.blam
      end
    end
  end
end