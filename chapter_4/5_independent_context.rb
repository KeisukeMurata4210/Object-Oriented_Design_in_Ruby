# Tripが他のオブジェクトを知っていることによって、Tripの「コンテキスト」は作られる
# 単一の責任を「持つ」けれど、コンテキストを「求める」
# テストでも再利用でも、そのコンテキストが確立されていることが求められる

# Tripは「常に」prepare_bicycleメッセージを自身のMechanicに送らないといけない
# -> prepare_bicycleに応答できるオブジェクトを用意しない限り、Tripの再利用はできない

# コンテキストの複雑さは、オブジェクトの再利用の難しさに直接関わる。
# もっとも良い状況は、オブジェクトがコンテキストから完全に独立していること。
# = 相手が誰で、何をするかも知らずに他のオブジェクトと共同作業できる
# -> 新しく、予期しない形で再利用できる。

# 図4.7
class Trip
    attr_reader :mechanic, :bicycles
    def initialize(mechanic, args)
        @mechanic = mechanic
        @bicycles = args
        # 旅行に使う自転車たちが格納された配列
    end
    
    # Tripが「何を」望んでいるかといえば、準備されること、のみ
    # 自転車が必要、という知識は、「どのように」旅行が準備されるか　＝ Mechanicの領域
    def prepare_trip
        # ①望むもの「準備」をMechanicに伝える
        mechanic.prepare_trip
    end
end

class Mechanic
    attr_reader :trip
    def initialize
    end

    def prepare_trip(trip)
        @trip = trip
        # ②準備が必要なbicycleの集まりを得るため、コールバック
        trip.bicycles.each do |bike|
            prepare_bicycle(bike)
        end
    end

    def prepare_bicycle(bike)
        clean_bicycle(bike)
        pump_bicycle(bike)
        lube_chain(bike)
        check_brakes(bike)
    end

    # Mechanicが各バイクにすべき作業たち
    def clean_bicycle(bike)
    end

    def pump_bicycle(bike)
    end

    def lube_chain(bike)
    end

    def check_brakes(bike)
    end
end

# Tripのパブリックインターフェースはbicyclesを含む
# Mechanicのパブリックインターフェースはprepare_tripを含む。ひょっとするとprepare_bicycleも含み得る
# Tripはprepare_tripに応答できるオブジェクトを持ち続けることを想定する
# Mechanicはprepare_tripと共に渡されてきた引数がbicyclesに応答することを想定する


# bicycleって、attr_readerのbicycleのことだったんだ！！！
# たしかに、そうするとシーケンス図の全てに合点が行く！

# 図4.5 「私は自分が何を望んでいるかを知っているし、あなたがそれをどのようにやるかも知っているよ」　<- どのように、を知っている
# 図4.6 「私は自分が何を望んでいるかを知っているし、あなたが何をするかも知っているよ」　　　　　　　<- 相手の何を、を知っている
# 図4.7 「私は自分が何を望んでいるかを知っているし、あなたが担当部分をやってくれると信じてるよ」　　<- 手放しの信頼

# 「何を」と「どのように」の違い、コンテキストと信頼の重要性