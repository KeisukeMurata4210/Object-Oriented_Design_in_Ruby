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
		{ tire_size: tire_size,
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

	def local_spares
		{ tape_color: tape_color }
	end

	def default_tire_size
		'23'
	end
end