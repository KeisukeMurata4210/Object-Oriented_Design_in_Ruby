# 設計上難しいのは、ダックタイプが必要だと気づくことと、抽象化すること

# 次のものはダックで置き換えられる
# ①クラスで分岐するcase文
# ②kind_of? is_a? 
# ③responds_to?

# ①クラスで分岐するcase文
class Trip
    attr_reader :bicycles, :customers, :vehicle
    def prepare(preparers)
        preparers.each { |preparer|
            case preparer
            when Mechanic
                preparer.prepare_bicycles(bicycles)
            when TripCoordinator
                preparer.buy_food(customers)
            when Driver
                preparer.gas_up(vehicle)
                preparer.fill_water_tank(vehicle)
            end
        }
    end
end
# prepareがその引数のそれぞれから望むものは何だろうか？　と問いかける

# ②kind_of? is_a? 
class Trip
    attr_reader :bicycles, :customers, :vehicle
    def prepare(preparers)
        preparers.each { |preparer|
            if preparer.kind_of?(Mechanic)
                preparer.prepare_bicycles(bicycles)
            elsif preparer.kind_of?(TripCoordinator)
                preparer.buy_food(customers)
            elsif preparer.kind_of?(Driver)
                preparer.gas_up(vehicle)
                preparer.fill_water_tank(vehicle)
            end
        }
    end
end
# caseをkind_of? is_a? で置き換えても依存は変わらない

# ③responds_to?
class Trip
    attr_reader :bicycles, :customers, :vehicle
    def prepare(preparers)
        preparers.each { |preparer|
            if preparer.responds_to?(:prepare_bicycles)
                preparer.prepare_bicycles(bicycles)
            elsif preparer.responds_to?(:buy_food)
                preparer.buy_food(customers)
            elsif preparer.responds_to?(:gas_up)
                preparer.gas_up(vehicle)
                preparer.fill_water_tank(vehicle)
            end
        }
    end
end
# クラス名に依存すべきではないと理解しつつダックは使いこなせない、という場合
# kind_of?をresponds_to?で置き換えたくなる
# 依存の数は減らしたとしても、依然としてクラスと固く結びついている
# Mechanic以外のクラスがprepare_bicyclesに応答するとは考えられない。
# クラスの明示的な参照を除去したからといって、騙されてはいけない。

# たとえ応答するメソッドがあっても、不必要な依存を含む。オブジェクトを信頼しているというより制御している。

# 柔軟なアプリケーションは、信頼に基づいて働くオブジェクトによって作られる。