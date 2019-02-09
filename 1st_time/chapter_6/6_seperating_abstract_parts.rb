class RoadBike < Bicycle
  attr_reader :tape_color
    
  def initialize(args)
    @tape_color = args[:tape_color]
    super(args) # <- RoadBikeは'super'を必ず呼ばなければならなくなった
  end
	
	def spares
		{ chain:      '10-speed',
			tire_size:  '23',
			tape_color: tape_color }
	end
end

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

class Bicycle
	attr_reader :size, :chain, :tire_size
	
	def initialize(args={})
		@size      = args[:size]
		@chain     = args[:chain]
		@tire_size = args[:tire_size]
	end
end