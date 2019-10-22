require '../codes/send_1.rb'

describe "Gear" do
  before do
    @observer = double('observer mock')
    @gear = Gear.new(
      chainring: 52,
      cog:       11,
      observer:  @observer )
  end
  context "when_cogs_change" do
    it "notifies_observer" do
      expect(@observer).to receive(:changed).with(52, 27)#呼ばれ「た」かを確認するんじゃなくて、example終了までに呼ばれ「る」ことを確認する
      @gear.set_cog(27)
    end
  end
  context "when_chainrings_change" do
    it "notifies_observer" do
      expect(@observer).to receive(:changed).with(42, 11)
      @gear.set_chainring(42)
    end
  end
end