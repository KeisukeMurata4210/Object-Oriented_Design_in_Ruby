require '../codes/inheritance_1.rb'

shared_context "BicycleInterface" do # これを満たせばBicycleのように振る舞うと信頼できる
  it "default_tire_size" do
    expect(@object.respond_to?(:default_tire_size)).to be_truthy
  end
  it "default_chain" do
    expect(@object.respond_to?(:default_chain)).to be_truthy
  end
  it "chain" do
    expect(@object.respond_to?(:chain)).to be_truthy
  end
  it "size" do
    expect(@object.respond_to?(:size)).to be_truthy
  end
  it "tire_size" do
    expect(@object.respond_to?(:tire_size)).to be_truthy
  end
  it "spares" do
    expect(@object.respond_to?(:spares)).to be_truthy
  end
end

describe "Bicycle" do
  before do
    @bike = @object = Bicycle.new({tire_size: 0})
  end
  include_context "BicycleInterface"
end

describe "RoadBike" do
  before do
    @bile = @object = RoadBike.new
  end
  include_context "BicycleInterface"
end