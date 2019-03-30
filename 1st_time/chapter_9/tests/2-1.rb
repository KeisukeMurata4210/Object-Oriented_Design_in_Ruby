require 'minitest/autorun'
require '../codes/2-1.rb'

class MiniTest::Unit::TestCase

  def setup
    @observer = MiniTest::Mock.new
    @gear     = Gear.new(
                  chainring: 52,
                  cog:       11,
                  observer:  @observer)
  end

  def test_notifies_observers_when_cogs_change
    @observer.expect(:changed, true, [52, 27]) # メソッドが呼び出されたと期待する(メソッド名, 戻り値, 引数の配列)
    @gear.set_cog(27) # set_cogを呼び出すと…
    @observer.verify  # expect()の期待通りのメソッドが呼び出されたかテストする
  end

  def test_notifies_observers_when_chainrings_change
    @observer.expect(:changed, true, [42, 11]) # メッセージを受け取ったことだけをチェックする
    @gear.set_chainring(42)                    # changedメソッドが何をするかは気にせず、Gearは「メッセージを送った」ことだけに責任を持つ
    @observer.verify
  end
end

# コマンドメッセージのテストではモックを使うのか

# todo コメントでテキストをまとめる