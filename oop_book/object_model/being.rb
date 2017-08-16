class BigValueError < StandardError ; end

LIMIT = 333
x = 3_432_453

begin

  if x > LIMIT
    raise BigValueError, "Exeeded the maximum value"
  end

  puts 'scripts continues'

rescue => e
  puts e
  p e
  exit 1
end
