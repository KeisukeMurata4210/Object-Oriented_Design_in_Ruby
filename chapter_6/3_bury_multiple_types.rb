class Bicycle
  attr_reader :style, :size, :tape_color,
              :front_shock, :rear_shock

  def initialize(args)
    @style       = args[:style]
    @size        = args[:size]
    @tape_color  = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  # 'style'の確認は、危険な道へ進む一歩
  def spares
    if :style == :road
      { chain:      '10-speed',
        tire_size:  '23',  # milimeters
        tape_color: tape_color }
    else 
      { chain:      '10-speed',
        tire_size:  '2.1', # inches
        rear_shock: rear_shock }
    end
  end
end

bike = Bicycle.new(
        style:       :mountain,
        size:        'S',
        front_shock: 'Manitou',
        rear_shock:  'Fox' )

puts bike.spares #->
=begin
{ chain:      '10-speed',
  tire_size:  '2.1',
  rear_shock:  'Fox' }
=end

=begin
引数のstyleによって、sparesが決定される。
弊害①：
  styleが増えるたびにif文を増やす必要がある。
弊害②：
  最後のelseがデフォルト値になるコードにした場合、デフォルト値が想定しない値である可能性がかなり高い
弊害③：
  if文内で重複した値がある。DRYじゃない。
弊害④：
  bicycleのパブリックインターフェースspares,sizeなどはまだ動くが、それ以外は信用できない。
  特定の部品が初期化されているかを予測できない。

継承：共通の振る舞いを持つものの、いくつかの面においては異なるという、強く関連した型によって起こされる問題を解決する。

継承とは、メッセージを自動で移譲する仕組み。
１つ目のオブジェクトがメッセージを受け取り、それが理解できないものだった場合、2つ目のオブジェクトに転送する。