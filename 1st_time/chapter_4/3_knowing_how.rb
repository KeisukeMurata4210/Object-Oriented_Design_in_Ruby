# 図4.4
class Customer
    attr_reader :name, :trip, :bicycle, :on_date, :of_difficulty
    def initialize(name, trip, bicycle, args)
        @name          = name
        @trip          = trip
        @bicycle       = bicycle
        @on_date       = args[:on_date]
        @of_difficulty = args[:of_difficulty]
    end

    def suitable_bicycle
        route_types.select do |route_type|
            bicycle.suitable_bicycle(on_date, route_type)
        end
    end

    def route_types
        # 配列を受け取る
        trip.suitable_trips(on_date, of_difficulty)
    end
end

class Trip
    def initialize
    end

    def suitable_trips(on_date, of_difficulty)
        # 配列route_type を返す　（＝日付と難易度を元に、「こういう旅行たちがあります」と返答する）
    end
end

class Bicycle
    def initialize
    end

    def suitable_bicycle(trip_date, route_type)
        # 「利用可能かどうか」＝ boolを返す
    end
end

# Tripから余計な責任は取り除いたが、それをCustomerに移しただけ
# 図4.4 の問題は、Moeが「何を」望むかだけでなく、
# 他のオブジェクトが「どのように」望むものを準備するかまで知っていること。
#  -> 厨房に入り込んで準備している