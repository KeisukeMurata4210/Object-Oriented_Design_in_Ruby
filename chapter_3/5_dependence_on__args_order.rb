# 初期化の引数をいじるのはよくあること。特に設計が定まってない最初のうちは。
# よりひどくなると、順番に依存したコードを変更するのが面倒になり、そのまま使い続けることもある。

# ①ハッシュを使う   ->   順番への依存が取り除かれ、安心して引数を変えられる。
class Gear1
    attr_reader :chainring, :cog, :wheel
    def initialize(args)
        @chainring = args[:chainring]
        @cog       = args[:cog]
        @wheel     = args[:wheel]
    end
    # キー名への依存は生まれているが、変更せざるを得ないリスクは低くなる。
    # キー名が、コメントの役割を果たす。

    # ハッシュと、元どおりの順番に依存する引数とを組み合わせる手もある。
    #   <- 安定しない引数と、安定した引数がある場合。
end

# デフォルト値を指定する。（一般的）
class Gear2
    attr_reader :chainring, :cog, :wheel
    def initialize(args)
        @chainring = args[:chainring] || 40
        @cog       = args[:cog]       || 18
        @wheel     = args[:wheel]
        # 左辺が存在しない（=nil）、左辺の値がnilかfalseの時、右辺のデフォルト値が代入される。
        # 真偽値を引数にとる、引数のfalseとnilの区別がいる時はこっち。
    end
end

# デフォルト値を指定する。（false,nilも引数に設定可能）
class Gear3
    attr_reader :chainring, :cog, :wheel
    def initialize(args)
        # fetchは、第一引数がキーとして存在しない時、第二引数がデフォルト値として代入される。
        # -> 値としてのnilや、falseを設定できる。
        @chainring = args.fetch(:chainring, 40)
        @cog       = args.fetch(:cog, 18)
        @wheel     = args[:wheel]
    end
end

# デフォルト値を指定する。（デフォルト値をinitializeから隔離）
class Gear4
    attr_reader :chainring, :cog, :wheel
    def initialize(args)
        # mergeメソッドは、重複するキーがあった場合引数のハッシュが優先される。
        args = defaults.merge(args)
        @chainring = args[:chainring]
        @cog       = args[:cog]
        @wheel     = args[:wheel]
    end

    def defaults
        {chainring: 40, cog: 18}
    end
    # デフォルト値が複雑な時（数字、文字以上のもの）に有効。
end