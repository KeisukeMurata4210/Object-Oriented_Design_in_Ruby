# 依存を全て取り去るのが理想だが、既に存在しているアプリケーション上では
# 厳しい制約があることがある。　その時は隔離を考える。
# 2章でstructクラスを使って責任を隔離したように、
# 状況が許すようになったら、依存を特定し削除できるよう、隔離する。
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

# 制約上、WheelをGearに注入できない、という場合。
class Gear1
    attr_reader :chainring, :cog, :rim, :tire
    def initialize(chainring, cog, rim, tire)
        @chainring = chainring
        @cog       = cog
        @wheel     = Wheel.new(rim, tire) # -> Gear1を生成すると、Wheelも作られてしまう。
        # Wheelインスタンスの生成を、gear_inchesからinitializeへ移動。
        # gear_inchesはきれいになり、依存はinitializeで公開される。
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        ratio * wheel.diameter
    end
end

class Gear2
    attr_reader :chainring, :cog, :rim, :tire
    def initialize(chainring, cog, rim, tire)
        @chainring = chainring
        @cog       = cog
        @rim       = rim
        @tire      = tire
    end

    # 必要になるとき（gear_inchesで呼ばれるとき）まで、Wheelは生成されない。
    def wheel
        @wheel ||= Wheel.new(rim, tire)
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        ratio * wheel.diameter
    end
end

# どちらもまだ、Wheelに依存している。Wheelの引数と順番を知っている、Wheelを独自に生成している。
# どういう依存があるか明らかにしたこと、再利用の障壁を下げたこと、は改善点。

# 依存するものを常に気に留め、それらを注入する習慣をつける。