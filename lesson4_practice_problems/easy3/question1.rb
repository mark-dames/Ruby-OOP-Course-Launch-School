class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet('Hello')
  end
end

class GoodBye < Greeting
  def bye
    greet('Goodbye')
  end
end

#What happens in each of the following cases:
hello = Hello.new
hello.hi #outputs "Hello" to the screen. The instance method greet we can call inside instance method hi, as we inherit from Greeting.

hello = Hello.new
hello.bye #This will raise a undefined method error. The instance mehtod bye is in another class and we don't inherit from that class. 

hello = Hello.new
hello.greet #This will raise argument error, need to put in an argument. greet takes a required parameter. 

hello = Hello.new
hello.greet('Goodbye') #this will output "Goodbye" to the screen. We can call the instance method as we inherit that from Greeting. 

Hello.hi #raises an error, we call here an instance method on the Class. Instance methods you can only call on an instance of a class. 
