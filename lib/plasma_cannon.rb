class PlasmaCannon < Weapon
  INIT_HEALTH = 200
  INIT_DAMAGE = 55

  def initialize
    super('Plasma Cannon', INIT_HEALTH, INIT_DAMAGE)
  end
end
