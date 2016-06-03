class BoxOfBolts < Item
  INIT_WEIGHT = 25
  DEFAULT_HEAL_POINT = 20

  def initialize
    super('Box of bolts', INIT_WEIGHT)
  end

  def feed(robot)
    robot.heal(DEFAULT_HEAL_POINT)
  end
end
