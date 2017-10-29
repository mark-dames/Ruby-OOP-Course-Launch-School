#Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.
class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

#What happens if you run kitty.class.generic_greeting? Can you explain this result?
kitty = Cat.new
kitty.class.generic_greeting
#it executes the method, because .class return value is the Cat class and on that
#return value we call .generic_greeting. 
#kitty in an instance/object of the Cat class. It's class is Cat.
