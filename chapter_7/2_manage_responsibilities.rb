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