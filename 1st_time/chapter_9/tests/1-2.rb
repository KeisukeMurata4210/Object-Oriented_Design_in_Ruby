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

class GearTest < MiniTest::Unit::TestCase
  def test_calculates_gear_inches
    gear = Gear.new(
            chainring: 52,
            cog:       11,
            wheel:     Wheel.new(26, 1.5))
    
    assert_in_delta(137.1,   
                    gear.gear_inches,
                    0.01)
  end
end