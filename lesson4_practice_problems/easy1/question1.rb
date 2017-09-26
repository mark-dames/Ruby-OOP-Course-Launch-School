=begin
Question 1

Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

1. true
2. "hello"
3. [1, 2, 3, "happy days"]
4. 142
Solution

All 4 examples are objects. All 4 examples are instances from a class.
In these cases it are instances from classes from the standard library. 
True is an instance of the Trueclass.
'hello' is an instance from the String class
[1, 2, 3, "happy days"] is an instance from the Array class
142 is an instance from the Fixnum class
=end

puts true.class
puts "hello".class
puts [1, 2, 3, "happy days"].class
puts 142.class
