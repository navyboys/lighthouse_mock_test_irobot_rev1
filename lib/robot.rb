class Robot
  WEIGHT_CAPACITY = 250
  INIT_HEALTH = 100
  DEFAULT_ATTACK_POINT = 5

  attr_accessor :position, :items, :items_weight, :health, :equipped_weapon

  def initialize
    @position = [0,0]
    @items = []
    @items_weight = 0
    @health = INIT_HEALTH
    @equipped_weapon = nil
  end

  def move_left
    position[0] -= 1
  end

  def move_right
    position[0] += 1
  end

  def move_down
    position[1] -= 1
  end

  def move_up
    position[1] += 1
  end

  def pick_up(item)
    return if (items_weight + item.weight) > WEIGHT_CAPACITY
    self.equipped_weapon = item if item.is_a?(Weapon)
    items << item
    self.items_weight += item.weight
  end

  def wound(point)
    self.health -= point
    self.health = 0 if health < 0
  end

  def heal(point)
    self.health += point
    self.health = 100 if health > 100
  end

  def heal!(point)
    raise RobotAlreadyDeadError if health <= 0
    heal(point)
  end

  def attack(target)
    if equipped_weapon.nil?
      target.wound(DEFAULT_ATTACK_POINT)
    else
      equipped_weapon.hit(target)
    end
  end

  def attack!(target)
    raise UnattackableEnemy unless target.is_a?(Robot)
    attack(target)
  end

end
