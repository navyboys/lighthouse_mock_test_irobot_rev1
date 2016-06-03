class Battery < Item
  INIT_WEIGHT = 25

  def initialize
    super('Battery', INIT_WEIGHT)
  end

  def recharge(robot)
    robot.shield_points = Robot::DEFAULT_SHIELD_POINT
  end
end
