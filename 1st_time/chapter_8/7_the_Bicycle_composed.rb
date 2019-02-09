# BicycleとParts、PartsとPartはそれぞれ、「has-a」の関係
# PartsとPartは「ロール」として捉えられている。
# Partsはsparesを実装する、Partはname,description,needs_bikeを実装する。

# Bicycle
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

# Parts
require 'forwardable'
class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable

  def initialize(parts)
    @parts = parts
  end

  def spares
    select {|part| part.needs_spare}
  end
end

# PartsFactory
require 'ostruct'
module PartsFactory
  def self.build(config,
                 parts_class = Parts)  
    parts_class.new(
      config.collect { |part_config|
        create_part(part_config)} )
  end

  def self.create_part(part_config)
    OpenStruct.new(
      name:        part_config[0],
      description: part_config[1],
      needs_spare: part_config.fetch(2, true) )
  end
end

# Partsオブジェクトの生成に必要な配列
road_config = 
  [['chain',      '10-speed'],
   ['tire_size',  '23'],
   ['tape_color', 'red']]

mountain_config = 
  [['chain',       '10-speed'],
   ['tire_size',   '2.1'],
   ['front_shock', 'Manitou', false],
   ['rear_shock',  'Fox']]

road_bike = Bicycle.new(
              size:  'L',
              parts: PartsFactory.build(road_config) )
# puts road_bike.spares

=begin
継承する場合との違いは、
sparesメッセージがハッシュではなく、オブジェクトの配列を返すこと
PartsはOpenStructオブジェクトからなる配列を持ち、それぞれのオブジェクトがPartの役割を担う
更に、新しい種類の自転車を作る時は、パーツ（〇〇_config）を作るだけでいい
=end

recumbent_config = 
  [['chain',     '9-speed'],
   ['tire_size', '28'],
   ['flag',      'tall and orange']]

recumbent_bike = 
  Bicycle.new(
    size:  'L',
    parts: PartsFactory.build(recumbent_config) )

puts recumbent_bike.spares