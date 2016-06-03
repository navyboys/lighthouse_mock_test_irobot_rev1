class Robot
  WEIGHT_CAPACITY = 250
  INIT_HEALTH = 100
  DEFAULT_ATTACK_POINT = 5
  DEFAULT_SHIELD_POINT = 50

  @@list = []

  attr_reader :position
  attr_reader :items
  attr_reader :items_weight
  attr_reader :health

  attr_accessor :equipped_weapon, :shield_points

  def initialize
    @position = [0,0]
    @items = []
    @items_weight = 0
    @health = INIT_HEALTH
    @equipped_weapon = nil
    @shield_points = DEFAULT_SHIELD_POINT
    @@list << self
  end

  def self.list
    @@list
  end

  # TODO: Danger, should be removed
  def self.list=(list)
    @@list = list
  end

  def self.in_position(x, y)
    @@list.select { |robot| robot.position == [x,y] }
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def move_up
    @position[1] += 1
  end

  def pick_up(item)
    return if (items_weight + item.weight) > WEIGHT_CAPACITY
    @equipped_weapon = item if item.is_a?(Weapon)
    item.recharge(self) if item.is_a?(Battery)
    item.feed(self) if (item.is_a?(BoxOfBolts) && health <= 80)
    items << item
    @items_weight += item.weight
  end

  def wound(point)
    if point <= shield_points
      @shield_points -= point
    else
      @health -= (point - @shield_points)
      @shield_points = 0
      @health = 0 if health < 0
    end
  end

  def heal(point)
    @health += point
    @health = 100 if health > 100
  end

  def heal!(point)
    raise RobotAlreadyDeadError if health <= 0
    heal(point)
  end

  def attack(target)
    if equipped_weapon.nil?
      target.wound(DEFAULT_ATTACK_POINT) if attackable?(target, 1)
    else
      if attackable?(target, equipped_weapon.range)
        equipped_weapon.hit(target)
        @equipped_weapon = nil
      end
    end
  end

  def attack!(target)
    raise UnattackableEnemy unless target.is_a?(Robot)
    attack(target)
  end

  def attackable?(target, range)
    (position[0] - target.position[0]).abs <= range &&
    (position[1] - target.position[1]).abs <= range
  end

  def scan
    robots = []
    robots += Robot.in_position((position[0] + 1), position[1])
    robots += Robot.in_position((position[0] - 1), position[1])
    robots += Robot.in_position(position[0], (position[1] + 1))
    robots += Robot.in_position(position[0], (position[1] - 1))
    robots
  end
end
