# 「型」＝ 変数の中身の分類を示す
# 数値は足し引きできる、文字列は結合できる、配列は添字でアクセスできる…

# Rubyでは、パブリックインターフェースへの信頼として行われる。
# オブジェクトとクラスが、常に一対一で対応するとは限らない。
# オブジェクトがもつパブリックインターフェースは、複数のクラスにまたがることもある。

class Trip
    attr_reader :bicycles, :customers, :vehicle

    def prepare(mechanic)
        mechanic.prepare_bicycles(bicycles)
        # 引数がprepare_bicyclesに応答すると固く信じている
    end
end

class Mechanic
    def prepare_bicycles(bicycles)
        bicycles.each{|bicycle| prepare_bicycle(bicycle)}
    end

    def prepare_bicycle(bicycle)
        # 
    end
end