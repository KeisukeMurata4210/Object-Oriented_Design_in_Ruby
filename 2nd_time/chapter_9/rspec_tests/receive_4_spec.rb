require '../codes/receive_4.rb'

describe "Wheel" do
  before do
    @wheel = Wheel.new(26, 1.5)
  end
  it "diameterizable_interfece" do#テストダブルによってメッセージ名が変更されても通ってしまうため（夢の世界に生きる）、このテストを追加する
    expect(@wheel.respond_to?(:diameter)).to be_truthy
  end
  it "diameter" do
    expect(@wheel.diameter).to be_within(0.01).of(29)
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