module MessageDialog
  def attack_message(**params)
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃"
    puts "会心の一撃" if attack_type == "special_attack"
  end

  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts <<-EOS
    #{target.name}は#{damage}のダメージを受けた
    #{target.name}の残りHPは#{target.hp}だ
    EOS
  end

  def end_message(result)
    if result[:brave_win_flag]
      puts <<~EOS
      勇者は勝った
      #{result[:exp]}の経験値と#{result[:gold]}のゴールドを手に入れ
      EOS
    else
      puts <<~EOS
      勇者はまけた
      目の前が真っ暗になった
      EOS
    end
  end

  def transform_message(**params)
    original_name = params[:original_name]
    transform_name = params[:transform_name]

    puts <<~EOS
    "#{original_name}は怒っている"
    "#{original_name}は#{transform_name}に変身した"
    EOS
  end
end