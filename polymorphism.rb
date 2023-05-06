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

# PikachuはPokemonの特徴を受け継いでいる(継承している)
class Pikachu < Pokemon
  # 親クラスに実装されているメソッドをオーバーライド(上書き)して別の処理を実装できる
  def attack
    p "#{@name} の10万ボルト!"
  end
end

class Zenigame < Pokemon
  # 親クラスに実装されているメソッドをオーバーライド(上書き)して別の処理を実装できる
  def attack
    p "#{@name} の水鉄砲!"
  end
end

# 「同じメソッド(attack)を呼んでも違う振る舞いをする」 性質のことを 「ポリモーフィズム」 と呼びます
p '------------------------------------------'
pikachu = Pikachu.new('ピカチュウ', 'かみなり', 90)
pikachu.attack
p '------------------------------------------'
zenigame = Zenigame.new('ゼニガメ', 'みず', 90)
zenigame.attack
