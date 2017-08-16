class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
    def swim
      "can't swim!"
    end
end


teddy = Dog.new
puts teddy.speak
puts teddy.swim

brenda = Bulldog.new
puts brenda.speak
puts brenda.swim

