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

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

p "NAME:#{brave.name}"
p "HP:#{brave.hp}"
p "OFFENSE:#{brave.offense}"
p "DEFFENSE:#{brave.defense}"

brave.hp -= 30

p "#{brave.name}はダメージを受けた!　残りHPは#{brave.hp}だ"