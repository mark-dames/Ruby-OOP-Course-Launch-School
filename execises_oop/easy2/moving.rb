module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Noble
  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    "#{title} #{name} #{gait} forward"
  end

  private

  def gait
    "struts"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk

kitty = Cat.new("Kitty")
kitty.walk

flash = Cheetah.new("Flash")
flash.walk

byron = Noble.new("Byron", "Lord")
p byron.walk

