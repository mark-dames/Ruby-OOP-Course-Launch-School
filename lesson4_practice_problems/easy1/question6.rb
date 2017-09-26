#What could we add to the class below to access the instance variable @volume?
class Cube
  attr_reader :volume #use attr_reader which makes a getter method
  def initialize(volume)
    @volume = volume
  end
end

cube = Cube.new(50)
puts cube.volume

puts '----------------------------------------------------------'

class Cube
  def initialize(volume)
    @volume = volume
  end

  def get_volume #define our own getter method.
    @volume
  end
end

cube = Cube.new(100)
puts cube.get_volume

