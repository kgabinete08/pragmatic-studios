require_relative 'project'

describe Project do

  before do
    @goal = 1000
    @funds = 200
    @project = Project.new("Startup", 1000, 200)
  end

  it "has an initial target amount" do
    @project.goal.should == 1000
  end

  it "needs more funds to reach target" do
    @project.funds_needed.should == @goal - 200
  end

  it "increases funds by 25 when funds are added" do
    @project.add_funds.should == @funds + 25
  end

  it "decreases funds by 15 when funds are subtracted" do
    @project.subtract_funds.should == @funds - 15
  end

  context "created with a default amount" do
    before do
      @goal = 1000
      @project = Project.new("Startup", @goal)
    end

    it "has a default fund amount of zero" do
      @project.funds.should == 0
    end
  end
end