module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
    def hello
      puts "I am a car"
    end
  end
end

car1 = Transportation::Car.new
