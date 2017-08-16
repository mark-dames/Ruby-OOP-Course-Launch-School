module Swim
  def swim
    "swimming!"
  end
end

module Guard
  def guard
    "guarding"
  end
end

class Pet
   def breath
    "breathing!"
  end
end

class Fish < Pet
  include Swim
end

class Mammals < Pet
  def run
    "running!"
  end

  def jump
    "jumping!"
  end
end

class Dog < Mammals
  include Swim
  include Guard

  def speak
    "bark!"
  end

  def fetch
    "fetching!"
  end
end

class Cat < Mammals
  def speak
    "mieaw"
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

teddy = Bulldog.new
puts teddy.speak
puts teddy.breath
p Bulldog.ancestors

nemo = Fish.new
puts nemo.swim
p Fish.ancestors

brenda = Dog.new
puts brenda.speak
puts brenda.fetch
puts brenda.swim
p Dog.ancestors
