require '../codes/inheritance_3.rb'

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

class StubbedBike < Bicycle
  def default_tire_size
    0
  end
  def local_spares
    {saddle: 'painful'}
  end
end

describe "StubbedBike" do # ダックタイプと同様に、スタブが古くならないことを保証する
  before do
    @object = StubbedBike.new
  end
  include_context "BicycleSubclassInterface"
end

describe "Bicycle" do
  before do
    @bike = @object = Bicycle.new({tire_size: 0})
    @stubbed_bike = StubbedBike.new
  end
  include_context "BicycleInterface"
  it "forces_subclasses_implement_default_tire_size" do
    expect{@bike.default_tire_size}.to raise_error NotImplementedError
  end
  it "includes_local_spares_in_spares" do#sparesメソッドのマージがちゃんとされているかテスト
    expect(@stubbed_bike.spares).to eq({tire_size: 0, chain: '10-speed', saddle: 'painful'})# ()つけないと{~~}が一かたまりだと認識しないようだ
  end
end

describe "RoadBike" do
  before do
    @bike = @object = RoadBike.new(tape_color: 'red')
  end
  include_context "BicycleInterface"
  include_context "BicycleSubclassInterface"
  it "tape_color_in_local_spare" do # この要領で具象クラス特有の振る舞いをテストしていく
    expect(@bike.local_spares[:tape_color]).to eq 'red'
  end # ゲッターをテストしないのは、プライベートメソッドとしてしか使われないからか。
end

describe "MountainBike" do
  before do
    @bike = @object = MountainBike.new(rear_shock: 33)
  end
  include_context "BicycleInterface"
  include_context "BicycleSubclassInterface"
  it "rear_shock_in_local_spare" do
    expect(@bike.local_spares[:rear_shock]).to eq 33
  end
end

# これすごいわ。。新しいサブクラスを本当に安心して作れる。。