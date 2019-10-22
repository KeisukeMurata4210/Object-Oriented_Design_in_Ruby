require '../codes/ducktype_1.rb'

shared_context "preparer_interface" do # minitestだとモジュール
  it "implement_prepare_trip" do
    expect(@object.respond_to?(:prepare_trip)).to be_truthy
  end
end

describe "Mechanic" do
  before do
    @object = @mechanic = Mechanic.new
  end
  include_context "preparer_interface"
end

describe "TripCoordinator" do
  before do
    @object = @trip_coordinator = TripCoordinator.new
  end
  include_context "preparer_interface"
end

describe "Driver" do
  before do
    @object = @driver = Driver.new
  end
  include_context "preparer_interface"
end

# 実際には、↑3つのメソッドそれぞれで、prepare_tripのテストを書く

describe "Trip" do
  it "request_trip_preparation" do
    preparer = double{"preparer mock"}
    trip = Trip.new
    expect(preparer).to receive(:prepare_trip).with(trip)
    trip.prepare([preparer])
  end
end
# 送信メッセージが送られたことの照明は、モックに期待したメッセージが送られていることを確認して終わり