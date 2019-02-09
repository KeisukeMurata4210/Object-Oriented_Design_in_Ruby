# 受け渡しするのは、できるだけ利便性の高いオブジェクトにする。
# それができない時の1つのテクニック。
class RevealingReferences
    attr_reader :wheels
    def initialize(data)
        @wheels = wheelify(data)
    end

    def diameters
        wheels.collect {|wheel|
            wheel.rim + (wheel.tire *2)}
    end

    Wheel = Struct.new(:rim,:tire)
    def wheelify(data)
        data.collect {|cell|
            Wheel.new(cell[0], cell[1])}
    end
end

# Structは2回newするのか。
# 1回目 -> class
# 2回目 -> インスタンス

# irb(main):001:0> s = Struct.new(:a, :b)
# => #<Class:0x00007fc72c3827a0>
# irb(main):002:0> s.class
# => Class

# irb(main):004:0> ss = s.new(1,3)
# => #<struct a=1, b=3>
# irb(main):005:0> ss.class
# => #<Class:0x00007fc72c3827a0>