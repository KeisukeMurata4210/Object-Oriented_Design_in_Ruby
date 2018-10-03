=begin
schedulable?に応答することが期待されるオブジェクトはBicycleだけではない。
MechanicとVehicleも。
=end
module Schedulable
  attr_writer :schedule

  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  # 必要に応じてインクルードする側で置き換える
  def lead_days
    0
  end
end
=begin
Bicycleにあったコードとの違い
・scheduleメソッドが追加　全般的なScheduleインスタンスを返す
・Scheduleに関する知識はSchedulableモジュール内に隔離され、依存がより減った
・lead_daysメソッドの追加　　クラスの継承と同じで、モジュールがメッセージを送るメソッドは実装しておく。テンプレートメソッドパターン
=end

class Bicycle
  include Schedulable

  def lead_days
    1
  end
  # -
end

require 'date'
starting = Date.parse("2018/10/3")
ending   = Date.parse("2018/10/7")

b = Bicycle.new
puts b.schedulable?(starting, ending)

class Vehicle
  include Schedulable

  def lead_days
    3
  end
  # -
end

class Mechanic
  include Schedulable

  def lead_days
    4
  end
  # -
end

=begin
抽象的であり、テンプレートメソッドパターンを使って特化を促している。
クラスの継承と同じ。
メソッドの探索が同じ道筋で行われることも。

「is-a」　　　　　　継承
「behaves-like-a」共有
=end