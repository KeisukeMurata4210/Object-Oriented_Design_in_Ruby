# 図4.5
class Trip
    attr_reader :mechanic, :bicycles
    def initialize(mechanic, args)
        @mechanic = mechanic
        @bicycles = args
        # 旅行に使う自転車たちが格納された配列
    end

    def bicycles
        # どのように、を知っている悪い例
        bicycles.each do |bike|
            mechanic.clean_bicycle(bike)
            mechanic.pump_bicycle(bike)
            mechanic.lube_chain(bike)
            mechanic.check_brakes(bike)
        end
    end
end

class Mechanic
    def initialize
    end

    # Mechanicが各バイクにすべき作業たち
    def clean_bicycle(bike)
    end

    def pump_bicycle(bike)
    end

    def lube_chain(bike)
    end

    def check_brakes(bike)
    end
end

# 図4.6
class Trip
    attr_reader :mechanic, :bicycles
    def initialize(mechanic, args)
        @mechanic = mechanic
        @bicycles = args
        # 旅行に使う自転車たちが格納された配列
    end

    def bicycles
        # 「どのように」を知る責任がMechanicに渡された
        bicycles.each do |bike|
            mechanic.prepare_bicycle(bike)
        end
    end
end

class Mechanic
    def initialize
    end

    def prepare_bicycle(bike)
        clean_bicycle(bike)
        pump_bicycle(bike)
        lube_chain(bike)
        check_brakes(bike)
    end

    # Mechanicが各バイクにすべき作業たち
    def clean_bicycle(bike)
    end

    def pump_bicycle(bike)
    end

    def lube_chain(bike)
    end

    def check_brakes(bike)
    end
end

# Tripのパブリックインターフェースはbicycleメソッドを含む
# Mechanicのパブリックインターフェースはprepare_bicycleメソッドを含む
# Tripはprepare_bicycleに応答できるオブジェクトを持ち続けることを想定する
#  -> 責任の大半をMechanicに渡した。

# Mechanicに変更があっても、Tripは正しい振る舞いを得ることができる
# Mechanicのパブリックインターフェースが小さくなった。
