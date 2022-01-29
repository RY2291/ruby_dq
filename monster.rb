require "./character.rb"

class Monster < Character
attr_accessor :name

  POWER_UP = 1.5
  HP_HALF = 0.5

  def initialize(**params)
    super(**params)
    @transform_flag = false
    @monster_hp_half = params[:hp] * HP_HALF
  end

  def attack(brave)
    if @hp <= @monster_hp_half && @transform_flag == false
      @transform_flag = true
      transform
    end

    damage = calculate_damage(brave)
    cause_damage(target: brave, damage: damage)

    attack_message
    damage_message(target: brave, damage: damage)
  end

  private

  def calculate_damage(target)
    @offense - target.defense
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]

    target.hp -= damage

    target.hp = 0 if target.hp < 0
  end

  def transform
    transform_name = "ドラゴン"

    transform_message(original_name: @name, transform_name: transform_name)
    
    @offense *= POWER_UP
    @name = transform_name
  end
end