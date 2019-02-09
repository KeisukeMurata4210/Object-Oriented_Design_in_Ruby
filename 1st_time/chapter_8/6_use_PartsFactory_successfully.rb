=begin
Partクラスを見てみると、シンプルでかつ、複雑な部分でさえPartsFactoryで重複している
OpenStructで置き換える

・StructとOpenStructの違い
　Structはクラスと同じく引数を順番に取るが、OpenStructはハッシュを引数に取る

コードを簡潔にする
=end
require './5_product_Parts'
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
# 凄い。メッセージにしてしまうことでbuildが簡潔になった
mountain_config = 
  [['chain',       '10-speed'],
   ['tire_size',   '2.1'],
   ['front_shock', 'Manitou', false],
   ['rear_shock',  'Fox']]

puts mountain_parts = PartsFactory.build(mountain_config)