require 'linguistics'
Linguistics.use :en

module Pluralize
  def pluralize(word, n = false)
    n == true ? word.en.plural : word
  end
end

module Displayable
  def display_welcome_message
    puts "Welcome to Tic Tac Toe #{human.name}!"
    puts "The player who reach 5 points first, wins the game!"
    puts ''
    sleep(1.0)
    clear
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts "Round winner:"\
           "#{@human} #{pluralize('point', @human.score > 1)}."
    when computer.marker
      puts "Round winner:"\
           "#{@computer} #{pluralize('point', @computer.score > 1)}."
    else
      puts "It's a tie!"
    end
    sleep(1.0)
  end

  def display_winner
    if human.score == 5
      puts "#{human} points and won this game!"
    else
      puts "#{computer} points and won this game!"
    end
  end

  def display_agian_message
    puts "Let's play agian!"
    puts ''
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def clear
    system 'clear'
  end
end

class Board
  attr_accessor :squares
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |     "
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}   "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}   "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}   "
    puts "     |     |     "
  end
  # rubocop:enable Metrics/AbcSize

  def []=(square, marker)
    @squares[square].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns a winning marker or returns nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end
end

class TTTPlayer
  attr_reader :marker, :board, :name
  attr_accessor :score

  def initialize(board)
    @board = board
    @score = 0
  end

  def to_s
    "#{name} have #{score}"
  end
end

class Human < TTTPlayer
  def initialize(board)
    @name = set_name
    @marker = set_marker
    super
  end

  def set_name
    name = ''
    loop do
      puts "Please enter your name:"
      name = gets.chomp
      break if !name.start_with?(" ")
    end
    name
  end

  def set_marker
    markers = ['X', 'V', 'U', 'I', 'A', 'T', 'P']
    marker = ''
    loop do
      puts "Please choose a marker: "
      puts markers.join(' ')
      marker = gets.chomp.upcase
      break if markers.include?(marker)
      puts "Not a valid input."
    end
    marker
  end

  def joinor(arr, delimeter = ', ', joining_word = 'or')
    case arr.size
    when 1
      arr[0]
    when 2
      "#{arr[0]} #{joining_word} #{arr[1]}"
    else
      arr.join(delimeter).insert(-2, "#{joining_word} ")
    end
  end

  def take_move
    puts "Choose a square #{joinor(board.unmarked_keys)}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = marker
  end
end

class Computer < TTTPlayer
  def initialize(board)
    @marker = 'O'
    @name = ["Chappie", "Oliver", "Benzy", "Olly"].sample
    super
  end

  def two_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 2
    markers.min == markers.max
  end

  def smart_computer_move
    offense = nil
    defense = nil
    Board::WINNING_LINES.each do |line|
      squares = @board.squares.values_at(*line)
      markers = squares.collect(&:marker)
      if two_identical_markers?(squares)
        idx = markers.index(' ')
        markers.include?('O') ? offense = line[idx] : defense = line[idx]
      end
    end

    return offense if offense
    return defense if defense

    return 5 if board.unmarked_keys.include?(5)

    board.unmarked_keys.sample
  end

  def take_move
    square = smart_computer_move
    board[square] = marker
  end
end

class TTTGame
  include Pluralize
  include Displayable
  FIRST_TO_MOVE = "choose"
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new(board)
    @computer = Computer.new(board)
    @current_player = FIRST_TO_MOVE
    choose if @current_player == "choose"
  end

  def play
    loop do
      display_welcome_message

      loop do
        display_board
        players_marking_squares
        update_score
        break if won_game?
        display_result
        reset
      end

      display_winner
      break unless play_agian?
      reset
      display_agian_message
    end

    display_goodbye_message
  end

  private

  def players_marking_squares
    loop do
      current_player_moves
      alternate_current_player
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def alternate_current_player
    @current_player = case @current_player
                      when "human"
                        "computer"
                      else
                        "human"
                      end
  end

  def choose
    puts "Please make a choice who starts playing the game:"\
         "\n\thuman\n\tcomputer"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if ["human", "computer"].include?(answer)
      puts "Not a valid choice."
    end
    FIRST_TO_MOVE.gsub!("choose", answer)
    answer == "human" ? @current_player = "human" : @current_player = "computer"
  end

  def human_turn?
    @current_player == "human"
  end

  def current_player_moves
    if human_turn?
      human.take_move
    else
      computer.take_move
    end
  end

  def update_score
    case board.winning_marker
    when human.marker
      human.score += 1
    when computer.marker
      computer.score += 1
    end
  end

  def won_game?
    human.score == 5 || computer.score == 5
  end

  def play_agian?
    answer = nil
    loop do
      puts 'Would you like to play agian?'
      puts "Please enter yes or no"
      answer = gets.chomp.downcase
      break if ['yes', 'no'].include? answer
      puts 'Sorry, must be yes or no'
    end

    answer == 'yes'
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def reset
    board.reset
    @current_player = FIRST_TO_MOVE
    reset_scores if won_game?
    clear
  end
end

game = TTTGame.new
game.play
