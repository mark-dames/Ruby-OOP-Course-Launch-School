=begin
In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?
=end

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end


  def make_one_year_older
    @age += 1
  end
end

cat = Cat.new('tabby')
puts cat.age
cat.make_one_year_older
puts cat.age

