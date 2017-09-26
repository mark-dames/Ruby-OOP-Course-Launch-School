class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

whiskers = Cat.new('Aegean')
whiskers.make_one_year_older
whiskers.make_one_year_older
puts whiskers.age

#You can see in the make_one_year_older method we have used self. What does self refer to here?
#self is referencing the current object/instance of the Cat class where the instance method is called on.
#It can read like: whiskers.age += 1. 

