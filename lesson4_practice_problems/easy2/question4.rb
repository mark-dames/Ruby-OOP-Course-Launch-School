class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

bee = BeesWax.new('murray')
puts bee.type 
bee.type = 'warwick'
puts bee.type 

#What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?
#we add the attr_accessor which makes a getter and setter method in one line
