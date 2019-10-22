require '../codes/inheritance_2.rb'

shared_context "BicycleInterface" do
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

shared_context "BicycleSubclassInterface" do
  it "post_initialize" do
    expect(@object.respond_to?(:post_initialize)).to be_truthy
  end
  it "local_spares" do
    expect(@object.respond_to?(:local_spares)).to be_truthy
  end
  it "default_tire_size" do
    expect(@object.respond_to?(:default_tire_size)).to be_truthy
  end
end # フックとしてスーパークラスにも実装されているから、サブクラスになくてもエラーにはならない。ただ、メッセージを壊してないと証明する。

describe "Bicycle" do
  before do
    @bike = @object = Bicycle.new({tire_size: 0})
  end
  include_context "BicycleInterface"

  it "forces_subclasses_implement_default_tire_size" do
    expect{@bike.default_tire_size}.to raise_error NotImplementedError
  end
end

describe "RoadBike" do
  before do
    @bile = @object = RoadBike.new
  end
  include_context "BicycleInterface"
  include_context "BicycleSubclassInterface"
end

describe "MountainBike" do
  before do
    @bile = @object = MountainBike.new
  end
  include_context "BicycleInterface"
  include_context "BicycleSubclassInterface"
end

# これすごいわ。。新しいサブクラスを本当に安心して作れる。。