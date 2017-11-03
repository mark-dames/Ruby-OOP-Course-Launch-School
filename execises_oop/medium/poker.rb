class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = {
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    VALUES.fetch(@rank, @rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    reset
  end
  
  def reset
    @deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
    
    @deck.shuffle!
  end
  
  def draw
    card = @deck.pop
    reset if @deck.empty?
    card
  end
end

class PokerHand
  def initialize(deck)
    @hand = []
    5.times { @hand << deck.draw }
  end
  
  def print
    puts @hand
  end
  
  def evaluate
    case 
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end
  
  private
  
  def get_suits
    @hand.map { |card| card.suit }
  end
  
  def get_ranks
    @hand.map { |card| card.rank }
  end
  
  def check_card_values
    card_values = @hand.map { |card| card.value }
    card_values.sort!
    idx = 1
    loop do
      break if idx == card_values.size
      return false if card_values[idx-1] != card_values[idx] - 1
      idx += 1
    end
    true
  end
  
  def royal_flush?
    suites = get_suits
    return false if suites.uniq.count != 1
    ranks = get_ranks
    [10, 'Jack', 'Queen', 'King', 'Ace'].all? do |rank|
      ranks.count(rank) == 1
    end
  end

  def straight_flush?
    suites = get_suits
    return false if suites.uniq.count != 1
    check_card_values
  end

  def four_of_a_kind?
    ranks = get_ranks
    ranks.any? { |rank| ranks.count(rank) == 4 }
  end

  def full_house?
    ranks = get_ranks
    ranks.any? { |rank| ranks.count(rank) == 3 } && ranks.any? { |rank| ranks.count(rank) == 2 }
  end

  def flush?
    suits = get_suits
    suits.uniq.size == 1
  end

  def straight?
    check_card_values
  end

  def three_of_a_kind?
    ranks = get_ranks
    ranks.any? { |rank| ranks.count(rank) == 3 }
  end

  def two_pair?
    ranks = get_ranks
    ranks_copy = ranks.clone
    ranks.keep_if { |rank| ranks_copy.count(rank) == 2 }.size == 4
  end

  def pair?
    ranks = get_ranks
    ranks_copy = ranks.clone
    ranks.keep_if { |rank| ranks_copy.count(rank) == 2 }.size == 2
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

class Array
  alias_method :draw, :pop
end

hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(2, 'Spades'),
  Card.new(2, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate
