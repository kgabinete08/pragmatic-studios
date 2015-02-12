require_relative 'movie'
require_relative 'waldorfandstatler'
require_relative 'snack_bar'

class Playlist
  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def play(viewings)
    puts "#{@name}'s playlist:"

    puts @movies.sort

    snacks = SnackBar::SNACKS
    puts"\nThere are #{snacks.size} available snacks in the Snack Bar."

    snacks.each do |snack|
      puts "#{snack.name} has #{snack.carbs} carbs"
    end

    1.upto(viewings) do |count|
      puts "\nViewing #{count}:"
      @movies.each do |movie|
        WaldorfAndStatler.review(movie)
        snack = SnackBar.random
        puts "#{movie.title} led to #{snack.carbs} #{snack.name} carbs being consumed."
        puts movie
      end
    end
  end

  def print_stats
    puts "\n#{@name}'s stats:"

    hits, flops = @movies.partition { |movie| movie.hit? }

    puts "\nHits:"
    puts hits.sort

    puts "\nFlops:"
    puts flops.sort
  end
end