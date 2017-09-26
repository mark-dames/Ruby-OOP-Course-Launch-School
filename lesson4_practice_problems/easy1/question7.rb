#What is the default return value of to_s when invoked on an object? 
#Where could you go to find out if you want to be sure?
#The default return value is a string representing obj. The defaut print a obj class
#and an encoding of the object id. We can find info in the Ruby standard library. 

class Cat
end

cat = Cat.new
puts cat



