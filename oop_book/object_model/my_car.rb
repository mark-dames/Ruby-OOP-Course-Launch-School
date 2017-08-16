module BlindSpot
  def blindspot
    "A truck has a blindspot."
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year
  attr_reader :model
  
  @@number_of_vehicles = 0
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.output_number_of_vehicles
    "There are #{@@number_of_vehicles} vehicles."
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def spray_paint(color)
    self.color = color
    "We sprayed your car with the color #{color}. You car is now #{color}"
  end

  def current_speed
    "You are now going #{@current_speed} mph."
  end
   
  def speed_up(number)
    @current_speed += number
    "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    "You push the brake and decelerate #{number} mph."
  end

  def shut_off
    @current_speed = 0
    "The car ride is over."
  end 

  def age
    "#{self.model} is #{calculate_age} years old"
  end

  private
  def calculate_age
    t = Time.new
    current_year = t.year
    current_year - self.year
  end
end

class MyCar < Vehicle
  DOORS = 4

  def to_s
    "My car is a #{color}, #{year}, #{model}!"
  end
end

class MyTruck < Vehicle
  include BlindSpot
  DOORS = 2

  def to_s
    "My Truck is a #{color}, #{year}, #{model}!"
  end
end

toyota = MyCar.new(2003, 'white', 'yaris')
puts toyota.current_speed
puts toyota.speed_up(50)
puts toyota.current_speed
puts toyota.brake(10)
puts toyota.current_speed
puts toyota.shut_off
puts toyota.color
toyota.color = 'purple'
puts toyota.color
puts toyota.year
puts toyota.spray_paint('darkblue')
puts toyota.color
MyCar.gas_mileage(13, 351)
my_car = MyCar.new("2010", "Ford Focus", "silver")
puts my_car

puts '------------------------------------------'

volvo = MyTruck.new(2011, 'blue', 'crosser')
puts volvo.current_speed
puts volvo.speed_up(25)
puts volvo.current_speed
puts volvo.brake(10)
puts volvo.shut_off
volvo.color = 'purple'
puts volvo.color
puts volvo.spray_paint('black')
puts volvo.color
MyTruck.gas_mileage(13, 351)
puts volvo

puts Vehicle.output_number_of_vehicles
puts volvo.blindspot

puts '-------------------'
puts "Method lookup path for car:"
puts MyCar.ancestors

puts '-------------------'
puts "Method lookup path for truck:"
puts MyTruck.ancestors

puts '-------------------'
puts "Method lookup path for vehicle:"
puts Vehicle.ancestors

puts toyota.age

