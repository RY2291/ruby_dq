require "./character"
require "./brave"
require "./monster"

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster1 = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)


loop do
  brave.attack(monster1) 
  break if monster1.hp <= 0

  monster1.attack(brave)
  break if brave.hp <= 0
end

battle_result = brave.hp > 0

if battle_result
  exp = (monster1.offense + monster1.defense) * 2
  gold = (monster1.offense + monster1.defense) * 3
  puts "#{brave.name}は戦いに勝った"
  puts "#{exp}の経験値と#{gold}ゴールドを手に入れた"
else
  puts "#{brave.name}は戦いに負けた"
end
