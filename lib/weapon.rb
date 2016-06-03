class Weapon < Item
  DEFAULT_RANGE = 1

  attr_reader :damage
  attr_reader :range

  def initialize(name, weight, damage)
    super(name, weight)
    @damage = damage
    @range = DEFAULT_RANGE
  end

  def hit(robot)
    robot.wound(damage)
  end
end
