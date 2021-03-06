require './message_dialog'

class GamesController
  include MessageDialog

  EXP_CONS = 2
  GOLD_CONS = 3

  def battle(**params)
    build_characters(params)

    loop do
      @brave.attack(@monster) 
      break if battle_end?
      @monster.attack(@brave)
      break if battle_end?
    end

    battle_judgement
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
    result = caluculate_of_exp_and_gold

    end_message(result)
  end

  def caluculate_of_exp_and_gold
    if brave_win?
      brave_win_flag = true
      exp = (@monster.offense + @monster.defense) * EXP_CONS
      gold = (@monster.offense + @monster.defense) * GOLD_CONS
    else
      brave_win_flag = false
      exp = 0
      gold = 0
    end

    {brave_win_flag: brave_win_flag, exp: exp, gold: gold}
  end
end