class ObscuringReferences
    attr_reader :data
    def initialize(data)
        @data = data
    end

    def diameters
        # 0はリム、1はタイヤ
        data.collect {|cell|
            cell[0] + (cell[1] * 2)}
        # dataは２次元配列になっている。
    end
    # ... インデックスで配列の値を参照するメソッドが他にもたくさん
end

# 隠蔽すればいい、というものではない。

# これがいけない理由
# ①dataメッセージの送り手（＝dataを使うクラス）が、
#   何のデータがどのインデックスにあるか知っている必要がある。
# ②diametersメソッドが、リムが[0]、タイヤは[1]にあると知っている。
#   ＝単一責任ではない
# ③diametersメソッドが、配列の構造（２次元配列）に依存している。
#   ＝構造が変わるとコードを変更せざるを得なくなる

# 教訓：複雑な構造への直接の参照はだめ。混乱する。
#   → structクラスを使う