class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, rim, tire)
        @chainring = chainring
        @cog       = cog
        @wheel     = Wheel.new(rim, tire)
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        ratio * wheel.diameter
    end

    Wheel = Struct.new(:rim, :tire) do
        def diameter
            rim + (tire * 2)
        end
    end
end

# 例題では、Wheelクラスを作らない想定
# 制約があったり、先が見えないので作らないでおいたりする仮定で。

# structクラスにdiameterを定義することで、
# 直径を計算する責任をGearクラスから取り除いだ。
# あくまで「Wheelクラスを作らない」という前提の元の処理