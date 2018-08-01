# 初期化の引数をいじるのはよくあること。特に設計が定まってない最初のうちは。
# よりひどくなると、順番に依存したコードを変更するのが面倒になり、そのまま使い続けることもある。

# ①ハッシュを使う   ->   順番への依存が取り除かれ、安心して引数を変えられる。
class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(args)
        @chainring = args[:chainring]
        @cog       = args[:cog]
        @wheel     = args[:wheel]
    end
    # （略）
end
# キー名への依存は生まれているが、変更せざるを得ないリスクは低くなる。
# キー名が、コメントの役割を果たす。

# ハッシュと、元どおりの順番に依存する引数とを組み合わせる手もある。
#   <- 安定しない引数と、安定した引数がある場合。

class Gear2
    attr_reader :chainring, :cog, :wheel
    def initialize(args)
        @chainring = args[:chainring] || 40
        @cog       = args[:cog]       || 18
        @wheel     = args[:wheel]
    end
end
