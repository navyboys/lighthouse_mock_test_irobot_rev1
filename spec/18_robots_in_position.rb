require_relative 'spec_helper'

describe Robot do
  describe '.in_position(x,y)' do
    before :each do
      Robot.class_variable_set :@@list, []
    end

    it 'no robots in position' do
      expect(Robot.in_position(0,0)).to eq([])
    end

    it 'one robot in position' do
      robot = Robot.new
      expect(Robot.in_position(0,0)).to include(robot)
    end

    it 'multiple robots in position' do
      robot1 = Robot.new
      robot2 = Robot.new
      expect(Robot.in_position(0,0)).to include(robot1, robot2)
    end
  end
end
