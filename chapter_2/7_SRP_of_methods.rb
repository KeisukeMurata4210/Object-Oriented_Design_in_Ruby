class MethodsSRP
    # Before:責任を2つ持っている。
    # ① wheelsを繰り返し処理
    # ② それぞれのwheelの直径を計算
    def diameters
        wheels.collect {|wheel|
            wheel.rim + (wheel.tire *2)}
    end

    # After:
    # 最初に、配列を繰り返し処理する
    def diameters_refactored
        wheels.collect {|wheel| diameter(wheel)}
    end
    # 次に、「一つ」の車輪の直径を計算する
    def diameter(wheel)
        wheel.rim + (wheel.tire * 2)
    end


    # Before:2つ以上の責任を持っている　車輪の直径の計算
    def gear_inches
        ratio * (rim + (tire * 2))
    end
    # After:
    def gear_inches_refactored
        ratio * tire_diameter
    end

    def tire_diameter
        rim + (tire * 2)
    end

    # ↑のリファクタリングで明らかになること
    # Gearがgear_inchesを計算するのは当然だが、車輪の直径まで計算すべきではない
end

# メソッドを単一責任にするリファクタリングは、最終的な設計が分かっていなくてもするべき
# 恩恵
# ① 全てのメソッドを単一責任にすると、クラスの役割が明確になる。
#    →他のクラスに切り出すべき振る舞いもみえる
# ② コメントの必要がなくなる
#    →コメントする必要があるなら、その部分のコードを別メソッドに切り出す。
#     その新しいメソッドの名前が、コメントの役割を果たすようになる
# ③ 再利用しやすく、それを促進する
# ④ 他のクラスへ簡単に移動できる
#    →リファクタリングやメソッド抽出の手間が省ける

# クラスやメソッドの単位は、案外小さいものなんだなぁ