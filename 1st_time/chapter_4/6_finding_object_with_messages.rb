# 3_knowing_how には、欠けているオブジェクトがある　-> TripFinder
# メッセージに注目することで、
# Customerがsuitable_tripsメッセージを送るのは妥当
# <-> 受け手の問題。メソッド実装に責任を持つオブジェクトがない、
# と、気づくことができる

# 図4.8
class Customer
    attr_reader :name, :tripfinder, :on_date, :of_difficulty, :need_bike
    def initialize(name, tripfinder, args)
        @name          = name
        @tripfinder    = tripfinder
        @on_date       = args[:on_date]
        @of_difficulty = args[:of_difficulty]
        @need_bike     = args[:need_bike]
    end

    def suitable_trips
        # 配列が返る 日付と難易度に合致して、かつ自転車を利用可能なルートの配列が返る
        tripfinder.suitable_trips(on_date, of_difficulty, need_bike)
    end
end

class TripFinder
    def initialize
    end

    def suitable_trips(on_date, of_difficulty, need_bike)
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

# シーケンス図は、オブジェクトからメッセージへと注意を切り替えるツール