class Bomb < Weapon
  INIT_WEIGHT = 40
  INIT_DAMAGE = 30

  def initialize
    super('Bomb', INIT_WEIGHT, INIT_DAMAGE)
  end

  def hit(target, attacker)
    sufferers = target.scan
    sufferers << target
    sufferers.delete(attacker)
    sufferers.each do |suffer|
      suffer.shield_points = 0
      suffer.health -= INIT_DAMAGE
      suffer.health = 0 if suffer.health < 0
    end
  end
end
