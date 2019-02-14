=begin
ギアの歯数(chainring)とギアの直径?（cog）
を掛け合わせると、
ペダル一漕ぎあたりの車輪の回転数を得られる。

ただ計算するだけならこれで十分。
=end
chainring = 52
cog       = 11
ratio     = chainring / cog.to_f
puts ratio

chainring = 30
cog       = 27
ratio     = chainring / cog.to_f
puts ratio