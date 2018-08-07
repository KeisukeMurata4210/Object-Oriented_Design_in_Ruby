# ダックを見つけ依存を取り除くための鍵は、
# 「Tripのprepareメソッドは単一の目的を果たすためにあるので、その引数も単一の目的を共に達成するために渡されてくる」
# と認識すること。

# その目的は、引数の背後にあるクラスには影響を受けない。
# -> それらのクラスの既存の動作を考えるのではなく、prepareが何を必要とするかを考える。
# prepareメソッドは、旅行を準備する。引数のクラスたちも、旅行を準備するためにやってくる。

# 「準備する人（preparers）」が
# 「旅行の準備をする（prepare_trip）」という、抽象的な視点
class Trip
    attr_reader :bicycles, :customers, :vehicle
    # 引数preparersは複数のインスタンスの配列と想定
    def prepare(preparers)
        preparers.each { |preparer|
            preparer.prepare_trip(self)}   # <- endがたくさんあるときは、{}を使った方が見やすい
        end
    end
end

# すべての準備者（preparers）は、
# prepare_tripに応答する
class Mechanic
    def prepare_trip(trip)
        trip.bicycles.each{|bicycle| 
            prepare_bicycle(bicycle)}
    end

    def prepare_bicycle(bicycle)
        # 
    end
end

class TripCoordinator
    def prepare_trip(trip)
        buy_food(trip.customers)
    end

    def buy_food(customers)
        #
    end
end

class Driver
    def prepare_trip(trip)
        vehicle = trip.vehicle
        gas_up(vehicle)
        fill_water_tank(vehicle)
    end

    def gas_up(vehicle)
        #
    end

    def fill_water_tank(vehicle)
        #
    end
end

# おもしろい。依存関係を管理する、で出てきたselfを渡して相手を信頼するやり方も使われている

# オブジェクト指向におけるポリモーフィズムとは、「複数のオブジェクトが同じメッセージに応答できること」
# ！継承やモジュールでの共有も、ポリモーフィズムか！　複数のオブジェクトが同じメッセージに応答できるようになるから！

# 暗黙の取り決め：「送り手の視点から見て」オブジェクトは入れ可能だと合意する