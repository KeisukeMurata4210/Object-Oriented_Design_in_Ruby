=begin
今のコードだと、
・Partオブジェクトの作り方を知っておく
・マウンテンバイク用、ロードバイク用など、種類ごとにどのパーツが必要か知っておく
必要がある。
→予め記述した内容に従って、正確なPartsオブジェクトをどの自転車にも製造できるようにする
=end
require './4_make_Parts_object_more_array-like'
road_config = 
  [['chain',      '10-speed'],
   ['tire_size',  '23'],
   ['tape_color', 'red']]

mountain_config = 
  [['chain',       '10-speed'],
   ['tire_size',   '2.1'],
   ['front_shock', 'Manitou', false],
   ['rear_shock',  'Fox']]

# ★PartsFactoryを作る
module PartsFactory
  def self.build(config,
                 part_class  = Part,
                 parts_class = Parts)
    
    parts_class.new(
      config.collect do |part_config|
        part_class.new(
          name:        part_config[0],
          description: part_config[1],
          needs_spare: part_config.fetch(2, true))
      end
    )
  end
end
=begin
config配列の構造を知っている
name,description,needs_spare　の順
→configを短く簡潔に表現できる
→Partsオブジェクトを作るときは「常に」このファクトリーを使うことになる
　そうしないと知識が重複する
=end
puts road_parts = PartsFactory.build(road_config)

# PartsFactoryは、設定用の配列と組み合わせて、Partsを作るための知識を隔離する。
# アプリケーション全体に散らばっていた知識が、モジュールと配列に収まった。