=begin
旅行のスケジュールを立てる場合。
必要なものは
・自転車（Bicycle）
・整備士（mechanic）
・自動車（moter vehicle）

FastFeet社にとって必要なのは、
この3つのオブジェクトのどれが利用可能でどれがすでに使われているかを特定できるようにしておくこと。

旅行中でなくとも、メンテナンスや休息が必要。
・自転車（Bicycle）　　　　=> 最低1日
・整備士（mechanic）     =>  最低4日
・自動車（moter vehicle）=>  最低3日

まずアンチパターンを書き、改善していく。

Scheduleクラスが存在し、以下のインターフェースがあるとする。
・scheduled?(target, starting, ending)
・add(target, starting, ending)
・remove(target, starting, ending)

schedulable?(target, starting, ending)
①targetのクラス名を確認して、適したlead_daysをstartingに足す。scheduled?を実行
↓
②ダックタイプ。targetオブジェクトにlead_daysメッセージを送り、返ってきた値をstartingに足す。
↓
③オブジェクト自身の振る舞いは自身が持つべき。Stringクラスがempty?を実装するように、schedulable?はScheduleではなくtargetが実装する。
=end

class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class}" + 
         "is not scheduled\n" +
         " between #{start_date} and #{end_date}"
    false
  end
end

class Bicycle
  attr_reader :schedule, :size, :chain, :tire_size

  # Scheduleを注入し、初期値を設定する
  def initialize(args={})
    @schedule = args[:schedule] || Schedule.new
    # -
  end

  
end