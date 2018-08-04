# 今まさに、拡張される設計を確立しようとしている！
# 「データ」と「振る舞い」を兼ね備えた「名詞」がクラスになる。
# これらのオブジェクトを、「ドメインオブジェクト」と呼ぶ。
# だが、オブジェクト間で交わされる「メッセージ」が大切。

# 図4.3
class Customer
    attr_reader :name, :trip, :on_date, :of_defficulty, :need_bike
    def initialize(name, trip, args)
        @name          = name
        @trip          = trip
        @on_date       = args[:on_date]
        @of_defficulty = args[:of_defficulty]
        @need_bike     = args[:need_bike]
    end

    def suitable_trips
        trip.suitable_trips(on_date, of_defficulty, need_bike)
    end
end

class trip
    def initialize
    end

    def suitable_trips(on_date, of_defficulty, need_bike)
    end
end
# この受け手は、このメッセージに答える責任を負うべきなのだろうか？
# クラス中心から、メッセージ中心に変わる。
# 「このクラスが必要なのは知っているけど、何をすべきなんだろう？」から、
# 「このメッセージを送る必要があるけど、誰が応答すべきなんだろう？」
# オブジェクトが存在するからメッセージを送るのではない、メッセージを送るためにオブジェクトは存在する。

# Customerがsuitable_tripsメッセージを送るのは理にかなっている。
# 問題は、Tripがそのメッセージを受け取るべきではない、ということ。
# suitable_tripsメッセージが必要だけど、送る場所がどこにもない、という状態。