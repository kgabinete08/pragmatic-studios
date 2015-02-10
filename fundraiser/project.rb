class Project
  attr_reader :funding_goal, :funds
  attr_accessor :name

  def initialize(name, funds, goal=3000)
    @name = name
    @funds = funds
    @funding_goal = goal
  end

  def add_funds(value)
    puts "Project #{@name} got more funds!"
    @funds += value.to_i
  end

  def subtract_funds(value)
    puts "Project #{@name} lost some funds"
    @funds -= value.to_i
  end

  def needed_funds
    @funding_goal - @funds
  end

  def to_s
    "Project #{@name} has #{@funds} in funding towards a goal of #{@funding_goal}."
  end
end