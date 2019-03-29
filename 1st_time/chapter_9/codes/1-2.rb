class Wheel
    attr_reader :rim, :tire
    def initialize(rim, tire)
        @rim      = rim
        @tire     = tire
    end
    
    def diameter
        rim + (tire * 2)
    end
    # ...
end

class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(args)
        @chainring = args[:chainring]
        @cog       = args[:cog]
        @wheel     = args[:wheel]
    end

    def gear_inches
        ratio * wheel.diameter # オブジェクト作成をGearから取り除いた。
        # diameterに応答するオブジェクトが渡される、ことを想定 ロール
    end

    def ratio
        chainring / cog.to_f
    end
    # ...
end