class Punt
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x 
    @y = y
  end

  def to_s
    "At point x is #{x} and at point y is #{@y}"
  end

  def +(andere_cordinaten)
    puts self.x + andere_cordinaten.x
    puts self.y + andere_cordinaten.y
  end

  def -(andere_cordinaten)
    puts self.x - andere_cordinaten.x
    puts self.y - andere_cordinaten.y
  end

end

b = Punt.new(10, 20)
puts b

c = Punt.new(5, 5)
puts c

c.+(b)
c.-(b)
