class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel)
        @chainring = chainring
        @cog       = cog
        @wheel     = wheel 
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        ratio * wheel.diameter
        # Gearがwheelに応答し、wheelがdiameterに応答することに依存している。
        # 今はいいが、もしgear_inchesが複雑になったとき(gear_inches2)、この依存をメソッド内に埋め込むのは危険。
    end

    # 依存関係のあるオブジェクトを変更するたびに、このメソッドを大きく変更せざるを得なくなる。
    def gear_inches2
        # たくさんの計算
        foo = some_intermediate_result * wheel.diameter
        # たくさんの計算
    end

    # ↑の改善。外部オブジェクトへの依存を取り出し、専用のメソッドにカプセル化。
    # ---------------------------------------------------------------------------
    def gear_inches3
        # たくさんの計算
        foo = some_intermediate_result * diameter
        # たくさんの計算
    end

    def diameter
        wheel.diameter
    end
    # ---------------------------------------------------------------------------
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