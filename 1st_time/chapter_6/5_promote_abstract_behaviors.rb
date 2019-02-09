class Bicycle
  attr_reader :size # <- RoadBikeから昇格した

  def initialize(args={})
    @size = args[:size] # <- RoadBikeから昇格した
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color
  
  def initialize(args)
    @tape_color = args[:tape_color]
    super(args) # <- RoadBikeは'super'を必ず呼ばなければならなくなった
  end
  # -
end

=begin
「すべてを下げてその中のいくつかを引き上げる」戦略
→失敗しても、抽象を見つけられないだけで済む。

反対に
「具体的な部分のみサブクラスに押し下げる」戦略だと、
抽象クラスに具象の振る舞いが残ってしまい、サブクラスの動きを壊す可能性がある

★間違っていた時に何が起こるだろう？
=end