class Player
  attr_reader :name

  def initialize
    @name = set_name
  end
end

class HumanPlayer < Player
  def set_name
    name = nil
    loop do
      puts "Please enter your name: "
      name = gets.chomp
      break(name) if !name.start_with?(' ')
      puts "Invalid input. Please try agian!"
    end
  end

  def obtain_one_guess
    loop do
      print "Enter a number between #{GuessingGame::RANGE.first} and #{GuessingGame::RANGE.last}: "
      guess = gets.chomp.to_i
      return guess if GuessingGame::RANGE.cover?(guess)
      print "Invalid guess."
    end
  end
end

class ComputerPlayer < Player
  def set_name
    %w(Chappie Oliver Katarina Mark).sample
  end

  def obtain_one_guess
    GuessingGame::RANGE.to_a.sample
  end
end

class GuessingGame
  MAX_GUESSES  = 7
  RANGE = 1..100

  RESULT_OF_GUESS_MESSAGE = {
    high: "number is too high.",
    low: "number is too low.",
    match: "That's the number!"
  }.freeze

  WIN_OR_LOSE = {
    high: :lose,
    low: :lose,
    match: :win
  }.freeze

  RESULT_OF_GAME_MESSAGE = {
    win: "won!",
    lose: "has no more guesses and lost!"
  }.freeze

  def initialize
    @secret_number = nil
    @human_player = HumanPlayer.new
    @computer_player = ComputerPlayer.new
  end

  def play
    reset
    human_result, computer_result = play_game
    display_game_end_message(human_result, @human_player.name)
    display_game_end_message(computer_result, @computer_player.name)
  end

  private

  def reset
    @secret_number = rand(RANGE)
  end

  def play_game
    result = nil
    human_result = nil
    computer_result = nil
    MAX_GUESSES.downto(1) do |remaing_guesses|
      display_guesses_remaining(remaing_guesses)
      human_result = check_guess(@human_player.obtain_one_guess)
      computer_result = check_guess(@computer_player.obtain_one_guess)
      puts "#{@human_player.name}:"
      puts RESULT_OF_GUESS_MESSAGE[human_result]
      puts "#{@computer_player.name}:"
      puts RESULT_OF_GUESS_MESSAGE[computer_result]
      break if human_result == :match || computer_result == :match
    end
    [WIN_OR_LOSE[human_result], WIN_OR_LOSE[computer_result]]
  end

  def display_guesses_remaining(remaining)
    puts
    if remaining == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{remaining} guesses remaining."
    end
  end

  def check_guess(guess_value)
    return :match if guess_value == @secret_number
    return :low if guess_value < @secret_number
    :high
  end

  def display_game_end_message(result, name)
    puts "", "#{name}: #{RESULT_OF_GAME_MESSAGE[result]}"
  end
end

game = GuessingGame.new
game.play

