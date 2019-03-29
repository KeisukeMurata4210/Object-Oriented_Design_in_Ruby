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
    attr_reader :chainring, :cog, :rim, :tire
    def initialize(args)
        @chainring = args[:chainring]
        @cog       = args[:cog]
        @rim       = args[:rim]
        @tire      = args[:tire]
    end

    def gear_inches
        ratio * Wheel.new(rim, tire).diameter
    end

    def ratio
        chainring / cog.to_f
    end
    # ...
end

=begin
受信メッセージ：送り手が自分を知っている　　＝依存されている
送信メッセージ：受け手は自分を知らなくていい＝依存されていない

依存されていない受信メッセージはテストしない！削除する
=end