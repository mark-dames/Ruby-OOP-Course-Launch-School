class GuessingGame

  def initialize
    @winning_number = rand(1..100)
    @limit = 7
  end

  def play
    loop do
      puts "You have #{@limit} guesses remaining."
      number = nil
      loop do
        print "Please enter a number between 1 and 100: "
        number = gets.chomp.to_i
        break if validate_number(number)
        puts "Invalid guess. enter a number between 1 and 100."
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

  def validate_number(number)
    number > 0 && number < 100
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

game = GuessingGame.new
game.play
