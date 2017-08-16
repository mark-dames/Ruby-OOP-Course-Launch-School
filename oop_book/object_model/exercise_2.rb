=begin
  A module is a collection of behaviors that is usable in other classes trough mixins. We use the include keyword inside every class to
  acces the method inside the module. It is said that we mixx it in. The purpose is to use behaviors in multiple classes and have one place for it.
  
=end


module Color
  def color(color)
    puts "The color of your vehicle is #{color}"
  end
end

class Car
  include Color
end

class MotorCycle
  include Color
end

class Bike
  include Color
end

toyota = Car.new
toyota.color("green")
mazda = Car.new
mazda.color('blue')
suzuki = MotorCycle.new
suzuki.color('yellow')
batavus = Bike.new
batavus.color('white')

