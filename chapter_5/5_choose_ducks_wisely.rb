# kind_of? responds_to? を使っても、受けのいいコードもある。

# <tt>find(:first, *args)</tt>を便利に使うためのラッパー
# このメソッドには<tt>find(:first)</tt>メソッドと
# 同じ引数をすべて渡せる。
def first(*args)
    if args.any?
        if args.first.kind_of?(Integer) ||
                (loaded?&& !args.first.kind_of?(Hash))
            to_a.first(*args)
        else
            apply_finder_options(args.first).first
        end
    else
        find_first
    end
end

# 違いは、クラスの安定性。IntegerやHashが変わる可能性、それもfirstを変更せざるを得ない形で変わる可能性は
# かなり低い。
# だとするなら、わざわざダックを見つけて実装したところでコストを下げる可能性は低い。
# 設計の目的はコストを下げること！！