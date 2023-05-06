# rubyには抽象クラスという言語上の機能はない
class Pokemon
  # Rubyにはプロパティという概念はないが、インスタンス変数に対してアクセサメソッドを定義することで、オブジェクトの状態を操作することができる
  def initialize(name, type, hp)
    @name = name
    @type = type
    @hp = hp
  end

  attr_accessor :name, :type, :hp

  # 空のメソッドを定義することで継承先のクラスで必ず実装しなければならないメソッド(仕様、インターフェース)を定義
  def attack
    # raise NotImplementedErrorを記述することにより、抽象メソッドが呼び出された場合に例外が発生し、そのメソッドが実装されていないことが出力される
    raise NotImplementedError, 'must be implemented in subclass'
  end
end

# PikachuはPokemonの特徴を受け継いでいる(継承している)
class Pikachu < Pokemon
  # 親クラスに定義されている仕様、インターフェース、メソッド(未実装)の実装を行う
  def attack
    p "#{@name} の10万ボルト!"
  end
end

class Zenigame < Pokemon
  # 親クラスに定義されている仕様、インターフェース、メソッド(未実装)の実装を行う
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
