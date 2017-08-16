class A
  attr_reader :getal

  def initialize(g)
    @getal = g
  end
end

class B < A
  def initialize(x)
    x -= 10
    super
  end

end

b = B.new(8)
puts b.getal
