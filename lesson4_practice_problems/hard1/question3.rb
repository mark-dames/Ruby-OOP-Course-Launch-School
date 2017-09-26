module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity

  def range
    @fuel_efficiency * @fuel_capacity
  end
end

class WheeledVehicle

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  include Moveable
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  include Moveable
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Boat
  attr_accessor :propeller_count, :hull_count
  include Moveable

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity, num_propellers = 1, num_hulls = 1)
    self.propeller_count = num_propellers
    self.hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end

class Catamaran < Boat 
end

class MotorBoat < Boat
end

auto = Auto.new
puts auto.range

motorcycle = Motorcycle.new
puts motorcycle.range

catamaran = Catamaran.new(100, 50.0, 4, 3)
puts catamaran.range
puts catamaran.propeller_count
puts catamaran.hull_count

motorboat = MotorBoat.new(50, 5.0)
puts motorboat.range
puts motorboat.propeller_count
puts motorboat.hull_count

