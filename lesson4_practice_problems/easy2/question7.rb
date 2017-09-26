class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

fluffy = Cat.new('Bengal')
puts Cat.cats_count
teddy = Cat.new('Birman')
puts Cat.cats_count

#Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?
=begin
The @@cats_count class variable keeps track how many Cat objects are made from the Cat class. Inside initialize, every time
we create a new Cat object, @@cats_count get incremented with 1. 
You can make some Cat objects and call the class method Cat.cats_count to retrieve the amount of cats. 
=end
