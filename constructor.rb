# Pokemonの設計図
class Pokemon
  # インスタンスの生成時に必ず呼ばれる初期処理のこと, rubyではinitializeがコンストラクタに当たる
  def initialize(name, type, hp)
    @name = name
    @type = type
    @hp = hp
  end

  attr_accessor :name, :type, :hp

  def attack
    p "#{@name} のこうげき！"
  end
end

# pokeがPokemonクラスの実態(インスタンス)
poke = Pokemon.new('リザードン', 'ほのお', 100)
p poke.name
p poke.type
poke.attack
p '------------------------------------------'
pikachu = Pokemon.new('ピカチュウ', 'かみなり', 90)
p pikachu.name
p pikachu.type
pikachu.attack
