require 'minitest/autorun'
require '../codes/1-2.rb'

class WheelTest < MiniTest::Unit::TestCase
  def setup
    @wheel = Wheel.new(26, 1.5)
  end

  # 依存オブジェクトを注入することで、メッセージに応答しなくなってもテストが通ってしまう
  # →テストを使ってロールを文書化
  def test_implements_the_diameterizable_interface
    assert_respond_to(@wheel, :diameter)
  end
  # 問題①：他の具象クラスと共有はできず、このテストを複製しなければならない
  # 問題②：メッセージに応答しなくなってもテストが通ってしまう、こと自体は解決できていない  9-5で！

  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5)
    assert_in_delta(29, 
                    wheel.diameter,
                    0.01)
  end
end

class DiameterDouble
  def diameter 
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