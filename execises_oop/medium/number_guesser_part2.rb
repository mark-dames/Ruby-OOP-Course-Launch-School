class GuessingGame

  def initialize(begin_number, end_number)
    @begin_number = begin_number
    @end_number = end_number
  end

  def play
    set_winning_number
    set_limit
    loop do
      puts "You have #{@limit} guesses remaining."
      number = nil
      loop do
        print "Please enter a number between #{@begin_number} and #{@end_number}: "
        number = gets.chomp.to_i
        break if validate_number(number)
        puts "Invalid guess. enter a number between #{@begin_number} and #{@end_number}."
      end

      check_number(number)
      break if win?(number)

      @limit -= 1
      if lose?
        puts "Your out of guesses. You lose!"
        break
      end
    end
  end

  private

  def set_winning_number
    @winning_number = rand(@begin_number..@end_number)
  end

  def set_limit
    size_of_range = @end_number - @begin_number
    @limit = Math.log2(size_of_range).to_i + 1
  end

  def validate_number(number)
    number > @begin_number && number < @end_number
  end

  def win?(number)
    @winning_number == number
  end

  def lose?
    @limit == 0
  end

  def check_number(number)
    if number < @winning_number
      puts "Your guess is too low"
    elsif number > @winning_number
      puts "Your guess is too high"
    else
      puts "You win!"
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play
