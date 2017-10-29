require 'set'

class MinilangRuntimeError < RuntimeError; end
class BadTokenError < MinilangRuntimeError; end
class EmptyStackError < MinilangRuntimeError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD MULT DIV MOD POP PRINT SUB)

  def initialize(program)
    @program = program
    @stack = []
    @register = 0
  end

  def eval(degrees)
    format(@program, degrees).split.each { |token| eval_token(token) }
  rescue MinilangRuntimeError => error
    puts error.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def push
    @stack.push(@register)
  end

  def pop
    raise EmptyStackError, "Empty Stack!" if @stack.empty?
    @register = @stack.pop
  end
  
  def add
    @register += pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def mult
    @register *= pop
  end

  def sub
    @register -= pop
  end

  def print
    puts @register
  end
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
minilang.eval(degrees_c: 0)
minilang.eval(degrees_c: -40)

MILES_PER_HOUR_TO_KM_PER_HOUR = 
  '3 PUSH 5 PUSH %<mph>d MULT DIV PRINT'
minilang = Minilang.new(MILES_PER_HOUR_TO_KM_PER_HOUR)
minilang.eval(mph: 40)

AREA_OF_RECTANGLE = 
  '%<length>d PUSH %<width>d MULT PRINT'

minilang3 = Minilang.new(AREA_OF_RECTANGLE)
minilang3.eval(length:80, width: 6)
