class Ccc
  def initialize(x, y)
    @x, @y = x , y
  end

  def openbaar
    puts "openbaar: x= #{@x}, y = #{@y}"
  end
 
  protected
  def beschermd
    puts "beschermd: x = #{@x}, y = #{@y}"
  end

  private
  def prive
    p "prive: x = #{@x}, y = #{@y}"
  end
end

a = Ccc.new(5, 6)
a.openbaar
a.beschermd
a.prive

