class Brave
  attr_reader :name, :defense, :offense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

class Monster < Brave
end

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster1 = Monster.new(name: "スライム", hp: 50, offense: 10, defense: 25)


p "NAME:#{brave.name}"
p "HP:#{brave.hp}"
p "OFFENSE:#{brave.offense}"
p "DEFFENSE:#{brave.defense}"


monster1.offense
brave.hp -= 10

p "#{monster1.name}は#{monster1.offense}のダメージを与えた"
p "#{brave.name}はダメージを受けた!　残りHPは#{brave.hp}だ"