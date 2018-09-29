class Bicycle
	attr_reader :size, :chain, :tire_size

	def initialize(args={})
		@size      = args[:size]
		@chain     = args[:chain]     || default_chain
		@tire_size = args[:tire_size] || default_tire_size

		post_initialize(args)  # Bicycleでは送信と…
	end

	def post_initialize(args) # …実装の両方を行う
		nil
	end

	def spares
		{ tire_size: tire_size
			chain:     chain    }.merge(local_spares)
	end

	# サブクラスがオーバーライドするためのフック
	def local_spares
		{}
	end

	def default_chain
		'10-speed'
	end

	def default_tire_size
		raise NotImplementedError,
			"The subclass must have a method named \"default_tire_size\""
	end
end

class RoadBike < Bicycle
	attr_reader :tape_color

	def post_initialize(args)
		@tape_color = args[:tape_color]
	end
=begin                 # initializeを丸ごとスーパークラスに委譲し、特化する必要があるもののみサブクラスにメッセージを送るようにする
	def initialize(args)
		@tape_color = args[:tape_color]
		super(args)
	end
=end

	def local_spares
		{ tape_color: tape_color }
	end

	def default_tire_size
		'23'
	end
end
=begin
・post_initializeによって、
　「何を」初期化する必要があるかは責任を持っているが、
　「いつ」初期化が行われるかには責任がない。 結合度の低減。

・local_sparesによって、
　RoadBikeは「Bicycleがsparesを実装していること」「sparesがハッシュを返すこと」を知る必要がなくなった。
　結合度の低減。
=end

class MountainBike < Bicycle
	attr_reader :front_shock, :rear_shock

	def post_initialize(args)
		@front_shock = args[:front_shock]
		@rear_shock  = args[:rear_shock]
	end

	def local_spares
		{ rear_shock: rear_shock }
	end

	def default_tire_size
		'2.1'
	end
end

# 新しいRecumbentBike
class RecumbentBike < Bicycle
	attr_reader :flag

	def post_initialize(args)
		@flag = args[:flag]
	end

	def local_spares
		{ flag: flag }
	end

	def default_chain
		'9-speed'
	end

	def default_tire_size
		'28'
	end
end