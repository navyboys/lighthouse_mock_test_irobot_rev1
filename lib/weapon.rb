class Weapon < Item
  DEFAULT_RANGE = 1

  attr_reader :damage, :range

  def initialize(name, weight, damage)
    super(name, weight)
    @damage = damage
    @range = DEFAULT_RANGE
  end

  def hit(target)
    target.wound(damage)
  end
end
