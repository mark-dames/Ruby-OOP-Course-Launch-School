class Fixnum
  def drievoud?
    self % 3 == 0
  end

  alias plus +
end

puts 6.drievoud?
puts 5.drievoud?

puts 5 + 6
puts 11.plus(12)

class Fixnum
  undef plus
end

puts 5 + 6
#puts 11.plus(12)

puts 3.methods.sort
