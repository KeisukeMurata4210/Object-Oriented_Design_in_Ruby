=begin 
名詞に注目する「自転車」「ギア」
「自転車」に感することは扱っていない。
「ギア」には「データ」と「振る舞い」がある。
  ↓
ギアをクラスにする
=end
class Gear
  attr_reader :chainring, :cog
  def initialize(chainring, cog) # newの引数でそのギアの値を設定
    @chainring = chainring
    @cog       = cog
  end

  def ratio
    chainring / cog.to_f
  end
end

puts Gear.new(52, 11).ratio
puts Gear.new(30, 27).ratio