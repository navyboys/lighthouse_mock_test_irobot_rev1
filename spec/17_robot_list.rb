require_relative 'spec_helper'

describe Robot do
  describe '@@list' do
    it 'should add to Robot.list when a robot is created' do
      robot = Robot.new
      expect(Robot.list.last).to eq(robot)
    end
  end
end
