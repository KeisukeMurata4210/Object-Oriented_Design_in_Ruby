require '../codes/ducktype_2.rb'

shared_context "Diameterizable" do # 振る舞いのテストを切り出す
  it "implement_diameterizable_interface" do
    expect(@object.respond_to?(:width)).to be_truthy
  end
end

describe "Wheel" do
  before do
    @wheel = Wheel.new(26, 1.5)
  end
  it "diameter" do
    expect(@wheel.width).to be_within(0.01).of(29)
  end
end

describe "DiameterDouble" do#ダブルが古くなることを防ぐ
  before do
    @object = DiameterDouble.new
  end
  include_context "Diameterizable"
end

class DiameterDouble
  def width
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