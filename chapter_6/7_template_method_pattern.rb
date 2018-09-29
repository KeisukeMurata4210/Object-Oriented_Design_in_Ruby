class Bicycle
	attr_reader :size, :chain, :tire_size
	
	def initialize(args={})
		@size      = args[:size]
		@chain     = args[:chain]     || default_chain　　　# <- メッセージを送る目的は、オーバーライドによって特化できる機会をサブクラスに与えること
		@tire_size = args[:tire_size] || default_tire_size
	end

	def default_chain # <- 共通の初期値
		'10-speed'
	end
end

class RoadBike < Bicycle
	# -
	def default_tire_size # <- サブクラスの初期値
		'23'
	end
end

class MountainBike < Bicycle
	# -
	def default_tire_size # <- サブクラスの初期値
		'2.1'
	end
end

=begin
テンプレートメソッドパターン：
スーパークラス内で基本の構造を定義し、
サブクラス固有の貢献を得るためにメッセージを送る
！サブクラスがアルゴリズムに影響を与える箇所はメッセージを送るようにする。
　影響を受ける部分をカプセル化
=end