class Ddd
  def initialize(x, y)
    @x, @y = x, y
  end

  def openbaar
    puts "Beschermd: #{@x}. #{@y}"
  end

  protected
    def beschermd
      puts "Beschermd: #{@x}, #{@y}"
    end

  private
    def prive
      puts "prive: #{@x}, #{@y}"
    end

  public
    def test(obj)
      openbaar
      self.openbaar
      obj.openbaar


      beschermd
      self.beschermd
      obj.beschermd
      puts

      prive
      self.prive #kan niet
      obj.prive #kan niet
    end
end

a = Ddd.new(5, 6)
x = Ddd.new(10, 11)
a.test(x)


