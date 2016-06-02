require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do
    it "raise error when heal a dead robot" do
      @robot.wound(101)
      expect { @robot.heal!(10) }.to raise_error(RobotAlreadyDeadError)
      @robot.health = 100
    end

    it "calls #heal method" do
      expect(@robot).to receive(:heal).with(20)
      @robot.heal!(20)
    end
  end

  describe "#attack!" do
    it "raise error when attact an item" do
      item = Item.new('Item', 50)
      expect { @robot.attack!(item) }.to raise_error(UnattackableEnemy)
    end

    it "calls #attack method" do
      robot = Robot.new
      expect(@robot).to receive(:attack).with(robot)
      @robot.attack!(robot)
    end
  end
end
