class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def fetch
    "fetching!"
  end

  def swim
    'swimming!'
  end
end

class Cat < Pet
  def speak
    'miaow'
  end
end

class Bulldog < Dog
   def swim
    "can't swim!"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

puts pete.run
#pete.speak return no method error

puts kitty.run
puts kitty.speak
#kitty.fetch return no method error

puts dave.speak

puts bud.run
puts bud.swim

puts Bulldog.ancestors
