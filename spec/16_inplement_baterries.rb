require_relative 'spec_helper'

describe Battery do
  before :each do
    @battery = Battery.new
  end

  it 'should be a item' do
    expect(@battery).to be_a(Item)
  end

  it 'should have a weight of 25' do
    expect(@battery.weight).to eq(25)
  end

  describe '#recharge' do
    it 'fills robot\'s shield points full' do
      robot = Robot.new
      robot.wound(30)
      @battery.recharge(robot)
      expect(robot.shield_points).to eq(50)
    end
  end
end

describe Robot do
  before :each do
    @robot = Robot.new
    @battery = Battery.new
  end

  describe '#pick_up' do
    it 'fills shield points full when battery picked up' do
      @robot.wound(40)
      @robot.pick_up(@battery)
      expect(@robot.shield_points).to eq(50)
    end

    it 'does not change shield point when other itms picked up' do
      box_of_bolts = BoxOfBolts.new
      @robot.wound(40)
      @robot.pick_up(box_of_bolts)
      expect(@robot.shield_points).to eq(10)
    end
  end
end
