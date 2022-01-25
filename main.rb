class Brave
  attr_reader :name, :defense, :offense
  attr_accessor :hp

  SP_ATTACK_CONST = 1.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    p "#{@name}の攻撃"

    attack_num = rand(4)

    if attack_num == 0
      puts "必殺攻撃"
      damage = calculate_sp_attack - monster.defense
    else
      puts "通常の攻撃"
      damage = @offense -monster.defense
    end

    monster.hp -= damage
    p "#{monster.name}は#{damage}のダメージを受けた"
    p "#{monster.name}のHPは#{monster.hp}だ"
  end

  def calculate_sp_attack
    @offense * SP_ATTACK_CONST
  end

end

class Monster < Brave
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

    damage = @offense - brave.defense
    brave.hp -=damage

    puts "#{brave.name}は#{damage}のダメージを受けた"
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  private

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

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster1 = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)


# p "NAME:#{brave.name}"
# p "HP:#{brave.hp}"
# p "OFFENSE:#{brave.offense}"
# p "DEFFENSE:#{brave.defense}"


brave.attack(monster1)
monster1.attack(brave)
