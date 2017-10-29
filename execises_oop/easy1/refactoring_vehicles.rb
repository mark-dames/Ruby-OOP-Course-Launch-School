class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  attr_reader :make, :model

  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

car = Car.new('toyota', 'yaris')
puts car

motorcycle = Motorcycle.new('honda', 'swift')
puts motorcycle

truck = Truck.new('Volvo', 'octavia', 2000)
puts truck
