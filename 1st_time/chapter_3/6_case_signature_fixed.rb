# Gearが外部インターフェースの場合　-> シグネチャの操作ができない場合
module SameFramework
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
        end
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

# 外部のインターフェースをラップし、自身を変更から守る
module GearWrapper
    def self.gear(args)
        SameFramework::Gear.new(args[:chainring],
                                args[:cog],
                                args[:wheel])
    end
    # 引数をラッパーの中で分解することで、変更の影響がこのモジュールだけに留まる。
    # 依存の隔離
end

# 引数を持つハッシュを渡すことで、引数の順番に依存する問題を解消
puts GearWrapper.gear(
    chainring: 52,
    cog:       11,
    wheel:     Wheel.new(26, 1.5)).gear_inches

# オブジェクトの作成が目的のオブジェクトを「ファクトリー」とも呼ぶ