=begin
（ペダル一漕ぎあたりの車輪の回転数を測る上で）「タイヤの大きさも考慮できるようにしてほしい」
という要望があり実装。

本来のGearクラスには属さない振る舞い「gear_inches」を持ってしまった。

・クラスに自我があるとして、メソッドを質問に置き換えた時に自然かどうか
・クラスを1文で説明した時に「それと」「または」が含まれないこと
で見分ける。
=end
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # よく分からないがタイヤについてこういう単位がある。
    ratio * (rim + (tire * 2))
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(52, 11, 24, 1.25).gear_inches

# 以前動いていた処理は動かない
# puts Gear.new(52, 11).ratio
# puts Gear.new(30, 27).ratio