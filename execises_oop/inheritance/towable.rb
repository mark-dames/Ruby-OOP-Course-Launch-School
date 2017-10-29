=begin
Using the following code, create a Towable module 
that contains a method named tow that print
I can tow a trailer! when invoked. Include the module in the Truck class.
=end

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car

end

truck1 = Truck.new
truck1.tow
