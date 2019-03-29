require 'minitest/autorun'
require '../codes/1-2.rb'

class WheelTest < MiniTest::Unit::TestCase
  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5)
    assert_in_delta(29, 
                    wheel.diameter,
                    0.01)
  end
end

# Diameterizableロールの担い手を作る（テストダブル）
class DiameterDouble
  def diameter # テストしたい項目以外（＝依存箇所）を固定することで、テスト項目に集中できる！
    10
  end
end

class GearTest < MiniTest::Unit::TestCase
  def test_calculates_gear_inches
    gear = Gear.new(
            chainring: 52,
            cog:       11,
            wheel:     DiameterDouble.new)
    
    assert_in_delta(47.27,   
                    gear.gear_inches,
                    0.01)
  end
end