require '../codes/receive_2.rb'

describe "Wheel" do
  it "diameter" do
    wheel = Wheel.new(26, 1.5)
    expect(wheel.diameter).to be_within(0.01).of(29)
  end
end

describe "Gear" do
  it "gear_inches" do
    gear = Gear.new(
      chainring: 52,
      cog:       11,
      wheel:     Wheel.new(26, 1.5) )
    expect(gear.gear_inches).to be_within(0.01).of(137.1)
  end
end