### ポケモンで学ぶ！クラスとオブジェクト指向
<https://zenn.dev/m_coder/books/oop-learning-with-pokemon/viewer/about>
上記の記事(Kotlin)のRubyバージョン
### クラス

- 概念

クラスとは、ざっくりいうと 「複数の変数/メソッドをまとめた設計図」
- ruby

```ruby
class Animal
end
```

### コンストラクタ

- 概念

クラスのオブジェクト初期化メソッド。インスタンスの生成時に必ず実行したい処理をメソッドを呼び出すことなく実行することができる
- ruby

```ruby
class Animal
  def initialize
  end
end
```


### 継承とポリモーフィズム

- 継承概念

継承とは、親クラス（=スーパークラス）の特徴を受け継いだ子クラス（=サブクラス）を作る仕組みのことです。
適切な継承を判断するための基準、「サブクラスはスーパークラスの一種である」と声に出して読んだ時に違和感がないこと
- ruby

```ruby
Dog < Animal
```
- ポリモーフィズム概念

ある1つの関数（メソッド）の呼び出しに対し、オブジェクト毎に異なる動作をする
- ruby

```ruby
class Animal
  def cry
  end
end

class Dog < Animal
  def cry
    p "わん"
  end
end

class Cat < Animal
  def cry
    p "にゃー"
  end
end

dog = Dog.new
cat = Cat.new
# 呼び出し側は同じcryというメッセージを送っているが、メッセージを受け取ったレシーバー側でそれぞれ異なる(多様な)動作をしている
dog.cry #=>わん
cat.cry #=>にゃー

```


### クラスの抽象化

- 概念

仕様(インターフェース)と実装の分離を実現する
- ruby

rubyには抽象クラスという言語上の機能はないが空のメソッドを定義することで継承先のクラスで必ず実装しなければならないメソッドを定義することができる。
```ruby
class AbstractAnimal
  def cry
    raise NotImplementedError, "must be implemented in subclass"
  end
end
```


### カプセル化

- 概念

データ（属性）とメソッド（手続き）を一つのオブジェクトにまとめ、その内容を隠蔽すること。
オブジェクト指向の考え方として、オブジェクト（=クラス）内のデータは可能な限り 隠蔽 し、外部には必要最低限のデータや手続き（メソッド）のみ公開するべきという考え方があル。
クラスの内部で定義されたデータやメソッドに対して、外部からのアクセスを制限すること。
- ruby

attr_accessor,attr_reader,attr_writerなどのアクセサでクラスの内部で定義されたデータに対しての外部からのアクセスを制限する
private,protected,publicなどのキーワードでクラス内部で定義されたメソッドに対しての外部からのアクセスを制限する

```ruby
class Actress
  attr_reader :name

  def initialize(name, age)
    @name = name
    @age = age
  end

  def greeting
    p "こんにちは、私の名前は#{@name}です"
  end

  def secret_info(password)
    return unless password == 'rightPassword'

    put_age
  end

  private

  def put_age
    p "私の年齢は#{@age}です"
  end
end

girl = Actress.new('sasaki', 31)
girl.greeting
p '---------rightPassword------------'
girl.secret_info('rightPassword')
p '---------wrongPassword------------'
girl.secret_info('wrongPassword')
```
