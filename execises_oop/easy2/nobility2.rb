module  Walkable
   def walk
    "#{name} #{gait} forward"
  end
end

class Animal
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Person < Animal
  include Walkable
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  include Walkable
  attr_reader :title

  def initialize(name, title)
    super(name)
  end

  def walk
    "#{title} #{super}"
  end

  private

  def gait
    "struts"
  end
end

class Cat < Animal
  include Walkable
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  include Walkable
  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk

flash = Cheetah.new("Flash")
p flash.walk

byron = Noble.new("Byron", "Lord")
p byron.walk

