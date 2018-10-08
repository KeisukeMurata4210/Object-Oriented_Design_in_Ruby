class Bicycle
    attr_reader :size, :parts
  
    def initialize(args={})
      @size  = args[:size]
      @parts = args[:parts]
    end
  
    def spares
      parts.spares
    end
  end
  
  class Parts
    attr_reader :parts
  
    def initialize(parts)
      @parts = parts
    end
  
    def spares
      parts.select{|part| part.needs_spare}
    end
  end
  
  class Part
    attr_reader :name, :description, :needs_spare
  
    def initialize(args)
      @name        = args[:name]
      @description = args[:description]
      @needs_spare = args.fetch(:needs_spare, true)
    end
  end

=begin
Bicycleのsparesはsizeに応答するが、
partsは応答しない。
・spares：partインスタンスの配列を返す
・parts：partsインスタンスそのものを返す

解決策①
Partsにsizeメソッドを実装し、partの配列を返すようにする
　→　Partsに対して、sort / eachなどの配列が応答するメッセージに応答して欲しくなる
　 配列の「ようなもの」にすればするほど、配列のように振舞うことを期待される
解決策②
Arrayのサブクラスとして定義してしまう
　→ Arrayのメソッドを実行した際の戻り値は、PartsではなくArrayになる。
　  その戻り値に対してPartsで実装したメソッドを呼べなくなる。
ex）
「+」メソッド。２つの配列を足し合わせる。Partsインスタンス2つを足し合わせると、結果はArrayになる。

sizeに応答しなくてもいい　→　元のコード
sizeだけが必要　　　　　　→  解決策① sizeを実装する
混乱するエラーが起きてもいい、
もしくは遭遇しない　　　　→  解決策② Arrayのサブクラスにする
=end