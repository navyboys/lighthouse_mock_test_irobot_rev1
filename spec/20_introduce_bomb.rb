require_relative 'spec_helper'

describe Bomb do
  let(:bomb) { Bomb.new }

  it 'should be a weapon' do
    expect(bomb).to be_a(Weapon)
  end

  it 'should have 1 range' do
    expect(bomb.range).to eq(1)
  end

  # - 1 -  a: attacker
  # 2 t 3  t: target
  # - a -  number: surrounders

  describe '#hit(overwrite)' do
    let(:bomb) { Bomb.new }
    let(:attacker) { Robot.new }
    let(:target) { Robot.new }
    let(:surrounder1) { Robot.new }
    let(:surrounder2) { Robot.new }
    let(:surrounder3) { Robot.new }

    before do
      target.move_up
      surrounder1.move_up.move_up
      surrounder2.move_left.move_up
      surrounder3.move_right.move_up

      attacker.pick_up(bomb)
      attacker.attack(target)
    end

    it 'should damage target through shileds' do
      expect(target.shield_points).to eq(0)
    end

    it 'should reduce target 30 health points to the target' do
      expect(target.health).to eq(70)
    end

    it 'should not damage itself' do
      expect(attacker.shield_points).to eq(50)
      expect(attacker.health).to eq(100)
    end

    it 'should damage all robots surrounding the target' do
      expect(surrounder1.shield_points).to eq(0)
      expect(surrounder1.health).to eq(70)
      expect(surrounder2.shield_points).to eq(0)
      expect(surrounder2.health).to eq(70)
      expect(surrounder3.shield_points).to eq(0)
      expect(surrounder3.health).to eq(70)
    end
  end
end
