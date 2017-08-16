class Teller
  attr_accessor :waarde

  def initialize(waarde)
    @waarde = waarde
  end

  def to_s
    "Your teller has a value of #{@waarde}"
  end

  def verhoog
    @waarde += 1
  end

  def verlaag
    @waarde -= 1
  end
end

teller1 = Teller.new(50)

puts teller1
puts teller1.waarde
teller1.verhoog
puts teller1.waarde
teller1.verlaag
puts teller1.waarde
