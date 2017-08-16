class Animal

  def make_noise
    "Some noise"
  end

  def sleep

    p self.class
  end

end

class Dog < Animal

  def make_noise
    'Woof!'
  end

end

class Cat < Animal

  def make_noise
    'Meow!'
  end
end

[Animal.new, Dog.new, Cat.new].each do |animal| 
  puts animal.make_noise
  animal.sleep
end
