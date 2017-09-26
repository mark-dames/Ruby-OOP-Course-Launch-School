#Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

hot_pizza = Pizza.new("cheese")
orange = Fruit.new("apple")

p hot_pizza.instance_variables
p orange.instance_variables


=begin
The Pizza class has the instance variable. You can notice that
on the @sign in front of it. This indicates that we are dealing
with an instance variable. Inside Fruit class we deal with a 
local variable, which can only be accessed in the initialize 
method itself. Instance variable scope is the object itself.
So it can be referenced inside all instance methods of the object.
=end


