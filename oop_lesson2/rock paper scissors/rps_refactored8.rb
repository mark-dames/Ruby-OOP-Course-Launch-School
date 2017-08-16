module Compare
  RULES = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['scissors', 'rock']
  }

  def compare(human_move, computer_move)
    RULES.each do |key, values|
      return true if key == human_move && values.include?(computer_move)
    end
    false
  end
end

class Rock
  attr_reader :value
  def initialize
    @value = 'rock'
  end

  def to_s
    @value
  end
end

class Scissors
  attr_reader :value
  def initialize
    @value = 'scissors'
  end

  def to_s
    @value
  end
end

class Paper
  attr_reader :value
  def initialize
    @value = 'paper'
  end

  def to_s
    @value
  end
end

class Lizard
  attr_reader :value
  def initialize
    @value = 'lizard'
  end

  def to_s
    @value
  end
end

class Spock
  attr_reader :value
  def initialize
    @value = 'spock'
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def increment_score
    @score += 1
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, spock or lizard."
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors', 'lizard', 'spock'].include?(choice)
      puts "Sorry, invalid choice."
    end

    self.move = get_move(choice)
  end

  def get_move(choice)
    case choice
    when 'rock' then Rock.new
    when 'scissors' then Scissors.new
    when 'paper' then Paper.new
    when 'lizard' then Lizard.new
    when 'spock' then Spock.new
    end
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = [Rock.new, Scissors.new, Paper.new,
                 Lizard.new, Spock.new].sample
  end
end

class RPSGame
  include Compare
  attr_accessor :human, :computer, :winner

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, paper, Scissors"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def determine_round_winner
    self.winner = human if compare(human.move.value, computer.move.value)
    self.winner = computer if compare(computer.move.value, human.move.value)
  end

  def set_scores
    human.increment_score if winner == human
    computer.increment_score if winner == computer
  end

  def display_round_winner
    if !winner.nil?
      puts "#{winner.name} won this round and has a score of #{winner.score}"
    else
      puts "It's a tie!"
    end
  end

  def won_game?
    if human.score == 10
      puts "#{human.name} has #{human.score} points and won the game!"
      true
    elsif computer.score == 10
      puts "#{computer.name} has #{computer.score} points and won the game!"
      true
    else
      false
    end
  end

  def play_agian?
    answer = nil
    loop do
      puts "Would you like to play agian? (y/n"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      determine_round_winner
      set_scores
      display_round_winner
      self.winner = nil
      next unless won_game?
      break unless play_agian?
      reset_score
    end
    display_goodbye_message
  end
end

RPSGame.new.play
