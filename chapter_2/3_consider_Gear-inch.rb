class Gear
    attr_reader :chainring, :cog, :rim, :tire
    def initialize(chainring,cog,rim,tire)
        @chainring = chainring
        @cog       = cog
        @rim       = rim
        @tire      = tire
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        # タイヤはリムの周りを囲むので、直径を計算するためには2倍する
        ratio * (rim + (tire * 2))
    end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(52, 11, 24, 1.25).gear_inches

puts Gear.new(52, 11).ratio
# Gearが単一責任になっていない。

# 見極める方法1つ目
# メソッドを、クラスへの質問に言い換えた時、意味をなす質問になっているか？
# ratio       = Gearさん、あなたの比を教えてください　　　　　　OK
# gear_inches = Gearさん、あなたのgear_inchesを教えてください NG

# 見極める方法2つ目
# 1文でクラスを説明してみる。
# 「それと」「または」があるのは2つ以上の責任を持ってしまっている