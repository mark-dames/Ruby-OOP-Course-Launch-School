#Using the following code, add a method named #identify that returns its calling object.
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def indentify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.indentify
kitty2 = Cat.new('Zoe')
p kitty2.indentify

p kitty
p kitty2
