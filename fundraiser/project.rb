class Project
  attr_reader :goal, :funds
  attr_accessor :name

  def initialize(name, goal, funds=0)
    @goal = goal
    @name = name.capitalize
    @funds = funds
  end

  def add_funds
    puts "Project #{@name} got more funds!"
    @funds += 25
  end

  def subtract_funds
    puts "Project #{@name} lost some funds"
    @funds -= 15
  end

  def funds_needed
    @goal - @funds
  end

  def to_s
    "Project #{@name} has #{@funds} in funding towards a goal of #{@funding_goal}."
  end
end