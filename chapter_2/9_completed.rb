# 8 から、「車輪の円周の計算」も欲しいという要望が来た
# →晴れて、Wheelクラスをつくる時が来た
# 8 でGearの単一責任を守ったことで、実装は難しくない
#       ＝structをWheelクラスとして独立させ、circumferenceメソッドを追加するのみ
class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel=nil)
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

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference

puts Gear.new(52, 11, @wheel).gear_inches

puts Gear.new(52, 11).ratio

# まだ完璧じゃないとのこと