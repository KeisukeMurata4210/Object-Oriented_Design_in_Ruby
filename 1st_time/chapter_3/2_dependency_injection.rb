class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel)
        @chainring = chainring
        @cog       = cog
        @wheel     = wheel # <- Wheelでなくとも、diameterを実装するオブジェクトであれば共同作業できるようになった。
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        # gear_inchesにとっては、
        # Wheelクラスも、Wheelがrimとtireで初期化されることも知る必要がない。
        # diameterを知っているオブジェクト、だけ知っていればいい。
        ratio * wheel.diameter
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