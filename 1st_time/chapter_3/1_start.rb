# メッセージを受け取ったオブジェクトの振る舞いは、
# ①オブジェクト自身が知っている　　　　　　　　　　　　　2章：単一責任のクラスを設計する
# ②または継承している　　　　　　　　　　　　　　　　　　6章：継承によって振る舞いを獲得する
# ③そのメッセージを理解する他のオブジェクトを知っている　3章：依存関係を管理する

# 「知っている」というのは、同時に依存を作り出す。
# 一方のオブジェクトを変更した時、他方も変更せざるを得ない恐れがある　＝　依存

# 依存がいけない理由。
# 依存　= オブジェクトたちが、一つの塊のように振る舞う
#       -> すべてのオブジェクト達に変更を加えざるを得なくなる。
#       -> 再利用は不可能。一から書き直した方が早い、という日がやってくる。 
# あとで扱う、２つの依存。メソッドチェーン、テスト。
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
        # Wheelへの参照が深いところにある　
        # ＝「Wheelインスタンスのギアインチしか計算する意思はない」
        # -> シリンダ、ディスクなどのオブジェクトを使うことになっても、
        #    それらが使うギアのギアインチを計算できない。
        ratio * Wheel.new(rim, tire).diameter
    end
end

class Wheel
    attr_reader :rim, :tire
    def initialize(rim, tire)
        @rim      = rim
        @tire     = tire
    end
    
    def diameter
        rim + (tire * 2)
    end

    def circumference
        diameter * Math::PI
    end
end

Gear.new(52, 11, 26, 1.5).gear_inches

# Wheelの引数が変わる、diameterメソッドが無くなったり名前が変わる、などすると、
# Gearクラスも変更せざるを得なくなる。

# オブジェクトが次のものを知っている時、オブジェクトに依存関係がある
# 他のクラスの名前：　　　　　　　　　　　　GearはWheelクラスの名前を知っている
# self以外に送ろうとするメッセージの名前： Gearは、Wheelがdiameterに応答すると知っている
# メッセージが要求する引数：　　　　　　　　Gearは、Wheel.newにrimとtireが必要なことを知っている
# それら引数の順番：　　　　　　　　　　　　Gearは、最初がrimで、2番目がtireだと知っている。