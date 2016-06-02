class Laser < Weapon
  INIT_HEALTH = 125
  INIT_DAMAGE = 25

  def initialize
    super('Laser', INIT_HEALTH, INIT_DAMAGE)
  end
end
