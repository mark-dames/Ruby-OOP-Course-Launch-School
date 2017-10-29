class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
#lookup path:
#Cat, first it looks in the class itself
#Animal, in this class it has the getter method color.
#it executed and Ruby stops also looking as it found the method.
p Cat.ancestors
p Bird.ancestors
