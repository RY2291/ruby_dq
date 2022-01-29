

class GamesController
  EXP_CONS = 2
  GOLD_CONS = 3


  def battle(**params)
    build_characters(params)

    loop do
      @brave.attack(@monster) 
      break if battle_end?
  
      @monster.attack(@brave)
      break if battle_end?

      battle_judgement
    end
  end
  
  private

  def build_characters(**params)
    @brave = params[:brave]
    @monster = params[:monster]
  end

  def battle_end?
    @brave.hp <= 0 || @monster.hp <= 0
  end

  def brave_win?
    @brave.hp > 0
  end

  def battle_judgement
    if brave_win?
      result = caluculate_of_exp_and_gold
      puts "#{@brave.name}は戦いに勝った"
      puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを手に入れた"
    else
      puts "#{@brave.name}は戦いに負けた"
    end
  end

  def caluculate_of_exp_and_gold
    exp = (@monster.offense + @monster.defense) * EXP_CONS
    gold = (@monster.offense + @monster.defense) * GOLD_CONS
    result = {exp: exp, gold: gold}

    result
  end

end