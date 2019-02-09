# 旅行コーディネイター、運転手も含まれたら
class Trip
    attr_reader :bicycles, :customers, :vehicle
    def prepare(preparers)
        preparers.each do |preparer|
            case preparer
            when Mechanic
                preparer.prepare_bicycles(bicycles)
            when TripCoordinator
                preparer.buy_food(customers)
            when Driver
                preparer.gas_up(vehicle)
                preparer.fill_water_tank(vehicle)
            end
        end
    end
end

class Mechanic
    def prepare_bicycles(bicycles)
        bicycles.each{|bicycle| prepare_bicycle(bicycle)}
    end

    def prepare_bicycle(bicycle)
        # 
    end
end

class TripCoordinator
    def buy_food(customers)
        #
    end
end

class Driver
    def gas_up(vehicle)
        #
    end

    def fill_water_tank(vehicle)
        #
    end
end

# メッセージではなくクラスに着目するとこうなる
# 心の奥底では、引数はMechanicのみ、と考えている

# 最初はそれで十分だが、Mechanic以外のクラスを扱う事になった瞬間から、
# prepare_bicyclesを理解しないオブジェクトを扱わなければならなくなる。
# 想像力がクラスに制限されていると、新しく増えたオブジェクトが理解するメッセージを探しに行く。
# ＝TripCoordinatorとDriverのパブリックインターフェースを調べに行き、buy_food、gas_up、fill_water_tankを実装する。
# しかし、prepareの引数はそれぞれ異なるクラス、異なるメソッド。

# case文で分岐させるが、そうすると依存が爆発的に増える。全て「どのように」を知っている。
# それぞれが特定のクラスとそのメソッドに依存している。また、特定のメソッド名とその引数を知っている。

# さらに悪い事に、このコードは増殖する。新しいオブジェクトが必要になるたびに、whenが増えていく
# たくさんのクラスを知っていて、それぞれに特定のメッセージを送るようになる。

# シーケンス図は、コードよりも簡単であるべき。コードと同じか複雑なシーケンス図になる場合、設計が間違っている。

# シーケンス図：loop繰り返し　alt条件分岐