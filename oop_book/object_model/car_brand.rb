module Car
  def car(brand)
    puts "#{brand}"
    puts brand.chars.map {|char| char.upcase }
  end
end

class CarBrand
  include Car
end

toyota = CarBrand.new
toyota.car('toyota')
mazda =  CarBrand.new
volvo =  CarBrand.new
