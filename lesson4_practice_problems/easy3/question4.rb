=begin
How could we go about changing the to_s output on this method to look like this: I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).
=end

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat!"
  end
end

cat = Cat.new('tabby')
cat2 = Cat.new('shep')

puts cat
puts cat2
