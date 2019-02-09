=begin
7 では、スーパークラス（Bicycle）が、一見するだけでは分からない要件をサブクラスに課している。
default_tire_sizeをスーパークラスは実装しておらず、サブクラス側で実装しないとエラーになる。
←default_tire_sizeをサブクラス側で実装する必要があるとは、コードを深く理解しないと気づけない。

サブクラスがメッセージを実装する必要があると明示的に示す。
　読む人には文書、読まない人にはエラーメッセージという形で有益な情報を提供する。
=end

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

	def default_tire_size
		raise NotImplementedError,
			"The subclass must have a method named \"default_tire_size\""
	end
	# 分かりやすいエラーメッセージを伴って失敗するコードを書くことは小さな努力しか要しないが、価値は永遠に続く
end

# テンプレートメソッドの要件は、有用なエラーを発生させる同名のメソッドを実装することで文書化すること
# なるほど、エラーメッセージは文書として使うのか。面白い。