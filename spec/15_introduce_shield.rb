require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  it 'starts with 50 shield points' do
    expect(@robot.shield_points).to eq(50)
  end

  describe '#wound' do
    it 'drains the shield when shield has enough points' do
      @robot.wound(40)
      expect(@robot.shield_points).to eq(10)
      expect(@robot.health).to eq(100)
    end

    it 'drains first shield then health when shield does not have enough points' do
      @robot.wound(130)
      expect(@robot.shield_points).to eq(0)
      expect(@robot.health).to eq(20)
    end

    it 'drains both shield and health when wound seriously' do
      @robot.wound(200)
      expect(@robot.shield_points).to eq(0)
      expect(@robot.health).to eq(0)
    end
  end
end

#   describe '#attack' do
#     context "equipped with grenade" do
#       before :each do
#         @robot.equipped_weapon = @grenade
#       end
#
#       context "with enemy robot two blocks above" do
#         before :each do
#           @robot2 = Robot.new
#           @robot2.move_up
#           @robot2.move_up
#         end
#
#         it "is able to successfully wound the enemy" do
#           expect(@robot2).to receive(:wound)
#           @robot.attack(@robot2)
#         end
#
#         it "should dispense the weapon (can only use once)" do
#           @robot.attack(@robot2)
#           expect(@robot.equipped_weapon).to be_nil
#         end
#       end
#
#       context "with enemy robot three blocks above" do
#         before(:each) do
#           @robot2 = Robot.new
#           @robot2.move_up
#           @robot2.move_up
#           @robot2.move_up
#         end
#
#         it "is NOT able to successfully wound the enemy" do
#           expect(@robot2).not_to receive(:wound)
#           @robot.attack(@robot2)
#         end
#       end
#     end
#   end
# end
