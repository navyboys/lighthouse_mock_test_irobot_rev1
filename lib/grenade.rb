class Grenade < Weapon
  INIT_HEALTH = 40
  INIT_DAMAGE = 15
  DEFAULT_RANGE = 2

  def initialize
    super('Grenade', INIT_HEALTH, INIT_DAMAGE)
    @range = DEFAULT_RANGE
  end
end
