class KrispyKreme
  attr_reader :glazing, :filling_type
  
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_string = filling_type ? filling_type : "Plain"
    glazing_string = glazing ? " with #{@glazing}" : ''
    filling_string + glazing_string
  end
end

donut1 = KrispyKreme.new(nil, nil)
puts donut1

donut2 = KrispyKreme.new('Vanilla', nil)
puts donut2

donut3 = KrispyKreme.new(nil, 'sugar')
puts donut3

donut4 = KrispyKreme.new(nil, 'chocolate sprinkles')
puts donut4

donut5 = KrispyKreme.new('Custard', 'icing')
puts donut5



