#What would happen if we added a play method to the Bingo class, 
#keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

class Game
  def play
    puts "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
  end

  def play
    "Starting the game!"
  end
end

bingo = Bingo.new
puts bingo.play

=begin
If we call bingo.play, the method lookup path will first look in the Bingo class itself for the play method. 
The play method is found there and gets executed. The play method up in the class hierarchie is ignored then.
=end

