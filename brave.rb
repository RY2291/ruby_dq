require "./character"

class Brave < Character
  SP_ATTACK_CONST = 1.5

  def attack(monster)
    attack_type = decision_attack_type
    damage = calculate_damage(target: monster, attack_type: attack_type)
    cause_damage(target: monster, damage: damage)

    attack_message(attack_type: attack_type)
    damage_message(target: monster, damage: damage)
  end


  private

  def decision_attack_type
    attack_num = rand(4)
    if attack_num == 0
      # p "会心の一撃"
      "special_attack"
    else
      # p "通常攻撃"
      "nomal_attack"
    end
  end

  def calculate_damage(**params)
    target = params[:target]
    attack_type = params[:attack_type]

    if attack_type == "special_attack"
      calculate_sp_attack - target.defense
    else
      @offense - target.defense
    end
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]
    
    target.hp -= damage

    target.hp = 0 if target.hp < 0

    # puts "#{target.name}は#{damage}のダメージを受けた"
  end

  def calculate_sp_attack
    @offense * SP_ATTACK_CONST
  end
end