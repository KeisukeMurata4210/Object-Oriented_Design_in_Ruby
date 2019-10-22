class Mechanic
  def prepare_bicycle(bicycle)
    # ..
  end
end

class TripCoordinator
  def buy_food(customers)
    # ..
  end
end

class Driver
  def gas_up(vehicle)
    #..
  end
  def fill_water_tank(vehicle)

  end
end

class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each {|preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.fill_water_tank(vehicle)
      end
    }
  end
end

# テストを書くまえにリファクタリングする。
# Preparerのインターフェースを決め、ロールの担い手すべてに実装する。→ducktype_1.rb