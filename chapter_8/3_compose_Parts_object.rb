=begin
パーツのリストは個々の部品を持つ。
part objects 個々の部品を表すオブジェクトの集合
parts object 個々の部品の集合を表すオブジェクト
=end

# Bicycleは同じ
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

# Partクラスを元に、一つ一つの部品を作る
chain = 
  Part.new(name: 'chain', description: '10-speed')

road_tire = 
  Part.new(name: 'tire_size', description: '23')

tape = 
  Part.new(name: 'tape_color', description: 'red')

mountain_tire = 
  Part.new(name: 'tire_size', description: '2.1')

rear_shock = 
  Part.new(name: 'rear_shock', description: 'Fox')

front_shock = 
  Part.new(
    name:        'front_shock',
    description: 'Manitou',
    needs_spare: false)

# 一つ一つの部品をPartsクラスに渡して、部品の集合（the parts）インスタンスを作る 
road_bike_parts = 
  Parts.new([chain, road_tire, tape])

road_bike_parts.spares.each{|part| puts part.name}
# chain
# tire_size
# tape_color

road_bike = 
  Bicycle.new(
    size:  'L',
    parts: Parts.new([chain, road_tire, tape]))

puts road_bike.parts
puts road_bike.spares

=begin
問題なく動く。sparesメソッドがハッシュを返すか、Partオブジェクトの配列を返すかの違い。
Partクラスのインスタンスではなく、Partのロールを担うオブジェクトと考えるべき。
（name / description / needs_spares）に応答できる。

なんか分かりずらいな。改善させていくのか。
=end