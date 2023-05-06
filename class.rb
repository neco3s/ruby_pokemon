# Pokemonの設計図
class Pokemon
  def initialize(name, type, hp)
    @name = name
    @type = type
    @hp = hp
  end

  attr_accessor :name, :type, :hp

  def attack
    print "#{@name} のこうげき！"
  end
end

# pokeがPokemonクラスの実態(インスタンス)
poke = Pokemon.new('リザードン', 'ほのお', 100)
p poke.name
p poke.type
poke.attack
