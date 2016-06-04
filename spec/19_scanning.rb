require_relative 'spec_helper'

describe Robot do
  describe '#scan' do
    before :each do
      # allow(Robot).to receive(:list).and_return([])
      # Black Magic
      Robot.class_variable_set :@@list, []
      @robot = Robot.new
    end

    it 'has no other robots surrounding' do
      expect(@robot.scan).to eq([])
    end

    it 'has one robot up and one right' do
      robot1 = Robot.new
      robot1.move_up
      robot2 = Robot.new
      robot2.move_right
      expect(@robot.scan).to include(robot1, robot2)
    end

    it 'has one robot down and one left' do
      robot1 = Robot.new
      robot1.move_down
      robot2 = Robot.new
      robot2.move_left
      expect(@robot.scan).to include(robot1, robot2)
    end
  end
end
