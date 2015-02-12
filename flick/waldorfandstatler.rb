require_relative 'die'
require_relative 'movie'

module WaldorfAndStatler
  def self.review(movie)
    die = Die.new
      
    case die.roll
    when 5..6
      movie.thumbs_up
    when 3..4
      puts "#{movie.title} was skipped."
    else
      movie.thumbs_down
    end
  end
end