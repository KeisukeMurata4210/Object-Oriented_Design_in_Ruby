class Bicycle
	attr_reader :size, :chain, :tire_size

	def initialize(args={})
		@size      = args[:size]
		@chain     = args[:chain]     || default_chain
		@tire_size = args[:tire_size] || default_tire_size
	end

	def spares
		{ tire_size: tire_size
			chain:     chain }
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

	def initialize(args)
		@tape_color = args[:tape_color]
		super(args)
	end

	def spares
		super.merge({ tape_color: tape_color})
	end

	def default_tire_size
		'23'
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
		super.merge({ rear_shock: rear_shock })
	end

	def default_tire_size
		'2.1'
	end
end

=begin
これで終わりではない。
サブクラス２つが、スーパクラスについて知っている。
（ハッシュを返すsparesを実装していること、initializeに応答すること）
スーパークラスについて知っていることも、依存を作り出す。
superの送信によって依存が作られている。
=end

# 上の依存が困る場合
class RecumbentBike < Bicycle
	attr_reader :flag

	def initialize(args)
		@flag = args[:flag]
		# superを送信するのを忘れた
	end

	def spares
		super.merge({ flag: flag })
	end

	def default_chain
		'9-speed'
	end

	def default_tire_size
		'28'
	end
end
=begin
①initializeでsuperを送り忘れると、
　Bicycleで提供される初期化（:size, :chain, :tire_size）
　が行われない。継承が何重にも続いた場合、デバックがかなり大変。

②sparesでsuperを送り忘れると、
　エラーは発生しないが、必要になったときに欲しい部品を呼び出せない、という状態になる。

・サブクラスは自身が行うことだけでなく、スーパークラスと「どのように関わるか」まで知っておくことが要求される。
・アルゴリズムの知識をサブクラスに押し下げ、サブクラスがsuperを送って参加することを強要している。
　->結果としてサブクラス間でコードが重複している
・サブクラスがsuperを送るとき、これは事実上、そのアルゴリズムを知っているという宣言です。つまり、サブクラスはこの知識に「依存」しているのです。
=end