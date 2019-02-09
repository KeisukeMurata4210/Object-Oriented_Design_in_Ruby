require  './2_where_to_apply_inheritance.rb'
class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock:  rear_shock,
                front_shock: front_shock)
  end
end

mountain_bike = MountainBike.new(
  size:        'S',
  front_shock: 'Manitou',
  rear_shock:  'Fox' )
puts mountain_bike.spares

=begin
設計は進化するもの。
この状況（親クラスにしようとするクラスが、具象クラスの振る舞いまで持ってしまっている）は常に発生する。
=end