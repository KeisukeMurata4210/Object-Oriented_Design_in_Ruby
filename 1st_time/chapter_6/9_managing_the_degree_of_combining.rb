# 書くのは簡単だけど結合が密なクラス
class RoadBike < Bicycle
	# -
	def spares
		{ chain:      '10-speed',
			tire_size:  '23',
			tape_color: tape_color}
	end
end
# 以前のコードでは、ハードコートされたchainとtire_sizeを変数とメッセージに入れて、Bicycleに昇格させた。

# 現在のMountainBike
class MountainBike < Bicycle
	# -
	def spares
		super.merge({rear_shock: rear_shock}) # <- スーパークラスのどれかがsparesを実装していることを想定
	end　　　　　　　　　　　　　　　　　　　　　　# superから返された結果に、ハッシュをマージする
end                                       # = 返されるのはハッシュであることも想定

class Bicycle
	# -
	def spares
		{ tire_size: tire_size,
			chain:     chain }
	end
end