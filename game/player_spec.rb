require_relative 'player'

describe Player do

  before do
    @initial_health = 80
    @player = Player.new("bob", 80)
  end

  it "has a capitalized name" do
    @player.name.should == "Bob"
  end

  it "has an initial health" do
    @player.health.should == @initial_health
  end

  it "has a score of health plus name length" do
    @player.score.should == (@player.health + @player.name.length)
  end

  it "has a string representation" do
    @player.to_s.should == "I'm Bob with a health of 80 and a score of 83."
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    @player.health.should == @initial_health + 15
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
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