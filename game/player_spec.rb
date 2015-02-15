require_relative 'player'
require_relative 'treasure_trove'

describe Player do

  before do
    @initial_health = 150
    @player = Player.new("bob", 150)
  end

  it "has a capitalized name" do
    @player.name.should == "Bob"
  end

  it "has an initial health" do
    @player.health.should == @initial_health
  end

  it "has a score of health plus points" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))
  
    @player.score.should == 250
  end

  it "has a string representation" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.to_s.should == "I'm Bob with health = 150, points = 100, and score = 250."
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    @player.health.should == @initial_health + 15
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
  end

  it "computes points as the sum of all treasure points" do
    @player.points.should == 0

    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 50

    @player.found_treasure(Treasure.new(:crowbar, 400))
    
    @player.points.should == 450
    
    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 500
  end

  it "yields each found treasure and its total points" do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    
    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end
    
    yielded.should == [
      Treasure.new(:skillet, 200), 
      Treasure.new(:hammer, 50), 
      Treasure.new(:bottle, 25)
   ]
  end

  it "can be created from a CSV string" do  
    player = Player.from_csv("larry,150")

    player.name.should == "Larry"
    player.health.should == 150
  end
  
  context "created with a default health" do
    before do
      @player = Player.new("bob")
    end

    it "has a health of 100" do
      @player.health.should == 100
    end
  end

  context "with a health of 150 or more" do
    before do
      @player = Player.new("bob", 150)
    end

    it "is a strong player" do
      @player.should be_strong
    end
  end

  context "with a health of 100 or less" do
    before do
      @player = Player.new("bob", 100)
    end

    it "is a wimpy player" do
      @player.should_not be_strong == false
    end
  end
end