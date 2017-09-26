module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

small_car =  Car.new
small_car.go_fast 

=begin
When we called the go_fast method from an instance of the Car class (as shown below) 
you might have noticed that the string printed when we go fast,
includes the name of the type of vehicle we are using. How is this done?

Inside the string on line 3 using string interpolation, we have self.class. self represents
the current instance/object where the method is called on. So in this example a car object.
As we know when we call the .class method, the return value is the class where the object
belongs too. In this case it print Car, because small_car is an instance of the Car class.
=end
