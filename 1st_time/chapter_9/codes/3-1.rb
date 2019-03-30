# ダックタイプを使う前
class Mechanic
  def prepare_bicycle(bicycle)
    # ...
  end
end

class TripCoordinator
  def buy_food(customers)
    # ...
  end
end

class Driver
  def gas_up(vehicle)
    # ...
  end

  def fill_water_tank(vehicle)
    # ...
  end
end

class Trip
  attr_reader :bicycle, :customers, :vehicle

  def prepare(preparers)
    preparers.each {|preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycle(bicycle)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    }
  end
end
# これコード足りないよね。「Mechanic」が何なのか示すコード

=begin
case文が3つの具象クラスとprepare()を結合している。
→ prepare()のテストがきつい　　これ今書いているテストコードにあったなぁ

テストコードを書くまえにリファクタリングする！！
=end