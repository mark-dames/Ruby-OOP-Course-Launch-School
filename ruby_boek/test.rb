class Sport
  attr_accessor :type
  
  @@number = 0
  def initialize(type)
    @type = type
    @@number += 1
  end

  def to_s
    "#{self.type} is the sport that you play."
  end

  def self.get_number
    @@number
  end

end

tennis = Sport.new('tennis')
puts tennis
puts tennis.type
tennis.type = 'golf'
puts tennis
puts Sport.get_number
