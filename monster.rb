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

    puts "#{@name}の攻撃"

    damage = calculate_damage(brave)
    cause_damage(target: brave, damage: damage)

    puts "#{brave.name}の残りHPは#{brave.hp}だ"
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

    puts "#{target.name}は#{damage}のダメージを受けた"
  end

  def transform
    transform_name = "ドラゴン"

    puts <<~EOS
    "#{@name}は怒っている"
    "#{@name}は#{transform_name}に変身した"
    EOS

    @offense *= POWER_UP
    @name = transform_name
  end
end