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
end

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster1 = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)


p "NAME:#{brave.name}"
p "HP:#{brave.hp}"
p "OFFENSE:#{brave.offense}"
p "DEFFENSE:#{brave.defense}"


brave.attack(monster1)
