require '../codes/receive_3.rb'

describe "Wheel" do
  it "diameter" do
    wheel = Wheel.new(26, 1.5)
    expect(wheel.diameter).to be_within(0.01).of(29)
  end
end

# DiameterDoubleの担い手を作る
class DiameterDouble
  def diameter
    10
  end
end

describe "Gear" do
  it "gear_inches" do
    gear = Gear.new(
      chainring: 52,
      cog:       11,
      wheel:     DiameterDouble.new )
    expect(gear.gear_inches).to be_within(0.01).of(47.27)
  end
end