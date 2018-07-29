class Gear
    def initialize(chainring,cog)
        @chainring = chainring
        @cog       = cog
    end

    def ratio
        @chainring / @cog.to_f    # <-- 破滅への道。attr_readerを使おう。
    end
end

# attr_readerによる、デフォルトの実装
# def cog
#   @cog
# end
# @cog を修正する必要が出た場合、↑のメソッドを修正するだけで済む。
# もし@cogを３０箇所で参照していたら…