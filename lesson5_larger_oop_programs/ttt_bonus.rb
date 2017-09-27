require_relative 'ttt_3x3'
require_relative 'ttt_5x5'

module Pluralize
  def pluralize(more_as_one_point)
    more_as_one_point == true ? "points" : "point"
  end
end

module Displayable
  def display_welcome_message
    puts "Welcome to Tic Tac Toe #{human.name}!"
    puts "The player who reach 5 points first, wins the game!"
    puts ''
    sleep(1.5)
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
      puts "#{@human} won this round!"
    when computer.marker
      puts "#{@computer} won this round!"
    else
      puts "It's a tie!"
    end
    display_points
    sleep(2.0)
  end

  def display_points
    puts ""
    puts "#{@human} has #{@human.score} "\
         "#{pluralize(@computer.score > 1 || @human.score == 0)}"
    puts "#{@computer} has #{@computer.score} "\
         "#{pluralize(@computer.score > 1 || @computer.score == 0)}"
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
    system('clear') || system('cls')
  end
end

class Board
  attr_accessor :squares
  attr_reader :winning_lines
  include Board3x3, Board5x5

  def initialize
    @squares = {}
    @board_type = choose_board
    @winning_lines = set_winning_lines
    reset
  end

  def choose_board
    board_type = ''
    loop do
      puts "With which board type you want to play Tic Tac Toe?"
      puts "Type 3x3 for for a 9 squares board or 5x5 for a 25 squares board"
      board_type = gets.chomp
      break if ['3x3', '5x5'].include?(board_type)
      puts "Invalid choice."
    end
    board_type
  end

  def set_winning_lines
    if @board_type == '3x3'
      Board3x3::WINNING_LINES
    else
      Board5x5::WINNING_LINES
    end
  end

  def draw
    if @board_type == "3x3"
      board3x3
    else
      board5x5
    end
  end

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

  def identical_markers?(line)
    if @board_type == '3x3'
      two_identical_markers?(line)
    else
      at_least_three_identical_markers?(line)
    end
  end

  def check_squares(line)
    squares = @squares.values_at(*line)
    markers = squares.collect(&:marker)
    idx = markers.index(' ')
    return line[idx], markers
  end

  # returns a winning marker or returns nil
  def winning_marker
    @winning_lines.each do |line|
      squares = @squares.values_at(*line)
      if winning_line?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    if @board_type == '3x3'
      (1..9).each { |key| @squares[key] = Square.new }
    else
      (1..25).each { |key| @squares[key] = Square.new }
    end
  end

  private

  def winning_line?(squares)
    if @board_type == '3x3'
      three_identical_markers?(squares)
    else
      five_identical_markers?(squares)
    end
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
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
    name
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
      break if !name.empty?
      puts "Invalid input."
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
      arr[0...-1].join(delimeter).insert(-1, " #{joining_word} #{arr[-1]}")
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

  def set_middle_square
    board.squares.keys.max / 2 + 1
  end

  def smart_computer_move
    middle_square = set_middle_square
    offense = nil
    board.winning_lines.each do |line|
      if board.identical_markers?(line)
        square, markers = board.check_squares(line)
        return square if markers.include?('O')
        offense = square
      end
    end

    return offense if offense

    return middle_square if board.unmarked_keys.include?(middle_square)
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
    choose_who_starts_game if @current_player == "choose"
  end

  def play
    loop do
      display_welcome_message

      loop do
        display_board
        players_marking_squares
        update_score
        break if won_game?
        display_result && reset
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

  def choose_who_starts_game
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
