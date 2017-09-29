module Displayable
  def clear
    system('clear') || system('cls')
  end

  def welcome_message
    puts "Welcome to the 21 Card Game!"
    puts "The goal is to get to close to a value of 21 as possible."
    puts "First you get 2 cards from the dealer. After that you can either hit"\
         " to take another card or stay to let the dealer take his turn."
    sleep(2.5)
    clear
  end

  def show_initial_cards
    puts "#{dealer} has: #{dealer.cards[0]} and an unknown card."
    puts "#{player} has: #{player.cards[0]} and a #{player.cards[1]}."
  end

  def show_player_cards
    puts "You have the following cards: #{player.cards}"
  end

  def show_result
    player_total = player.total
    dealer_total = dealer.total
    if player_total == dealer_total
      puts "It's a draw!"
    elsif player_total > 21
      puts "#{dealer} won the game!"
    elsif dealer_total > 21
      puts "#{player} won the game!"
    else
      winner = comparing_cards
      puts "#{winner} won the game!"
    end
  end

  def show_cards
    puts "The cards of #{player} where: #{player.cards}"
    puts ""
    puts "The cards of #{dealer} where: #{dealer.cards}"
  end

  def display_again_message
    puts "Let's play agian!"
  end

  def goodbye_message
    puts "Thank you for playing 21 Card Game. Goodbye!"
  end
end

class Participant
  attr_accessor :cards, :total
  attr_reader :card_deck

  def initialize(card_deck)
    @cards = []
    @card_deck = card_deck
    @total = 0
  end

  def reset
    self.total = 0
    self.cards = []
  end

  def hit
    @cards << card_deck.take_card
  end

  def busted?
    total > 21
  end

  def get_value(card)
    ['jack', 'queen', 'king'].include?(card) ? 10 : card
  end

  def get_ace_value(total_value)
    total_value + 11 > 21 ? 1 : 11
  end

  def update_total
    self.total = calculate_total_value
  end

  def calculate_total_value
    total_value = 0
    cards.each do |card|
      next if card == 'ace'
      total_value += get_value(card)
    end

    return total_value if !cards.include?('ace')
    aces = cards.select { |card| card == 'ace' }
    aces.each { |_| total_value += get_ace_value(total_value) }
    total_value
  end

  def to_s
    @name
  end
end

class Player < Participant
  def initialize(card_deck)
    @name = set_name
    super(card_deck)
  end

  def valid_name(name)
    !name.empty? && !name.start_with?(' ')
  end

  def set_name
    puts "Please enter your name:"
    name = ''
    loop do
      name = gets.chomp
      break if valid_name(name)
      puts "Invalid input. Please try agian."
    end
    name
  end
end

class Dealer < Participant
  def initialize(card_deck)
    @name = ['Chappie', 'Teddy', 'Oliver', 'Kim'].sample
    super(card_deck)
  end

  def stay?
    total >= 17
  end
end

class CardDeck
  attr_accessor :cards

  def initialize
    @cards = set_card_deck
  end

  def set_card_deck
    {
      hearts: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
      diamonds: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
      clubs: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
      spades: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
    }
  end

  def reset
    @cards = set_card_deck
  end

  def take_card
    suite = cards.keys.sample
    card = cards[suite].sample
    cards[suite].delete(card)
    card
  end
end

class Game
  include Displayable
  attr_reader :player, :dealer, :card_deck

  def initialize
    @card_deck = CardDeck.new
    @player = Player.new(card_deck)
    @dealer = Dealer.new(card_deck)
  end

  def start
    welcome_message
    loop do
      deal_cards
      show_initial_cards
      player_turn
      dealer_turn if !player.busted?
      show_result
      show_cards
      break if !play_again?
      reset_game
      display_again_message
    end
    goodbye_message
  end

  private

  def deal_cards
    2.times { player.cards << card_deck.take_card }
    2.times { dealer.cards << card_deck.take_card }
  end

  def player_turn
    loop do
      puts "Do you want to Hit or Stay?"
      answer = ''
      loop do
        answer = gets.chomp.downcase
        break if ['hit', 'stay'].include?(answer)
        puts "Invalid choice. Must be hit or stay."
      end

      player.hit && player.update_total if answer == 'hit'
      break if player.busted? || answer == 'stay'
      show_player_cards
    end
  end

  def dealer_turn
    loop do
      break if dealer.stay? || dealer.busted?
      dealer.hit
      dealer.update_total
    end
  end

  def comparing_cards
    return player if player.total == 21
    return dealer if dealer.total == 21

    (21 - player.total) < (21 - dealer.total) ? player : dealer
  end

  def play_again?
    answer = ''
    loop do
      puts "Do you want to play agian? Enter yes or no."
      answer = gets.chomp.downcase
      break if ['yes', 'no'].include?(answer)
      puts "Invalid answer. Must be yes or no."
    end
    answer == 'yes'
  end

  def reset_game
    card_deck.reset
    player.reset
    dealer.reset
    clear
  end
end

Game.new.start
