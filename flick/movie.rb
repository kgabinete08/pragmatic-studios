class Movie
  attr_accessor :title
  attr_reader :rank

  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
  end

  def normalized_rank
    @rank / 10
  end

  def thumbs_up
    @rank += 1
    puts "#{@title} got a thumbs up!"
  end

  def thumbs_down
    @rank -= 1
    puts "#{@title} got a thumbs down!"
  end

  def hit?
    @rank >= 5
  end

  def flop?
    @rank < 5
  end

  def <=>(other_movie)
    other_movie.rank <=> @rank
  end

  def weekday
    current_time = Time.new
    current_time.strftime("%A")
  end

  def to_s
    "#{@title} has a rank of #{@rank}"
  end
end