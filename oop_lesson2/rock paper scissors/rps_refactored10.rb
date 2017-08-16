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

module PickMove
  def pick_move(choices)
    current = 0
    max = choices.values.reduce(:+)
    random_value = rand(max) + 1
    choices.each do |key, val|
      current += val
      return key.to_s if random_value <= current
    end
  end
end

module Move
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
end

class Player
  attr_accessor :move, :score, :history_of_moves, :name

  def initialize
    set_name
    @score = 0
    @history_of_moves = []
  end

  def increment_score
    @score += 1
  end

  def get_move(choice)
    case choice
    when 'rock' then Move::Rock.new
    when 'scissors' then Move::Scissors.new
    when 'paper' then Move::Paper.new
    when 'lizard' then Move::Lizard.new
    when 'spock' then Move::Spock.new
    end
  end

  def display_history_of_moves
    rock_count = @history_of_moves.count('rock')
    paper_count = @history_of_moves.count('paper')
    scissors_count = @history_of_moves.count('scissors')
    lizard_count = @history_of_moves.count('lizard')
    spock_count = @history_of_moves.count('spock')
    puts '------------------------------------------------'
    puts "History of choices for #{name}: "
    puts "Rock: #{rock_count} times."
    puts "Paper: #{paper_count} times."
    puts "Scissors: #{scissors_count} times."
    puts "Lizard: #{lizard_count} times."
    puts "Spock: #{spock_count} times."
    puts '------------------------------------------------'
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
      choice = gets.chomp.downcase
      break if ['rock', 'paper', 'scissors', 'lizard', 'spock'].include?(choice)
      puts "Sorry, invalid choice."
    end

    self.move = get_move(choice)
  end
end

class Computer < Player
  attr_accessor :personalities
  include PickMove

  def initialize
    set_personalities
    super
  end

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number5'].sample
  end

  def set_personalities
    @personalities = {
      'R2D2' => { rock: 80, paper: 2, scissors: 5, lizard: 10, spock: 3 },
      'Hal' => { rock: 20, paper: 20, scissors: 20, lizard: 20, spock: 20 },
      'Chappie' => { rock: 70, paper: 10, scissors: 10, lizard: 5, spock: 5 },
      'Sonny' => { rock: 10, paper: 10, scissors: 10, lizard: 10, spock: 60 },
      'Number5' => { rock: 30, paper: 30, scissors: 0, lizard: 30, spock: 10 }
    }
  end

  def choose
    choice = pick_move(personalities[name])
    self.move = get_move(choice)
  end
end

class RPSGame
  include Compare
  attr_accessor :human, :computer, :winner

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      set_moves
      display_moves
      add_moves_to_history
      determine_round_winner
      set_scores
      display_round_winner
      next unless won_game?
      break unless play_agian?
    end
    human.display_history_of_moves
    computer.display_history_of_moves
    display_goodbye_message
  end

  private

  def freeze_screen
    sleep(2.0)
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_welcome_message
    puts "Welcome to Rock, paper, Scissors"
  end

  def set_moves
    human.choose
    computer.choose
  end

  def display_moves
    puts "----------------------------------------"
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    puts "----------------------------------------"
  end

  def add_moves_to_history
    human.history_of_moves << human.move.value
    computer.history_of_moves << computer.move.value
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
    freeze_screen
    clear_screen
  end

  def won_game?
    if human.score == 10 || computer.score == 10
      display_winner_of_game
      reset_game_score
      true
    else
      reset_round_winner
      false
    end
  end

  def display_winner_of_game
    puts "#{winner.name} has #{winner.score} points and won the game!"
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

  def reset_game_score
    human.score = 0
    computer.score = 0
  end

  def reset_round_winner
    self.winner = nil
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end
end

RPSGame.new.play
