module Board5x5
  WINNING_LINES = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15]] +
                  [[16, 17, 18, 19, 20], [21, 22, 23, 24, 25]] + # rows
                  [[1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23]] +
                  [[4, 9, 14, 19, 24], [5, 10, 15, 20, 25]] + # cols
                  [[1, 7, 13, 19, 25], [5, 9, 13, 17, 21]] # diagonals
  # rubocop:disable Metrics/AbcSize, Metrics/LineLength, Metrics/MethodLength:
  def board5x5
    puts "     |     |     |     |     "
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  |  #{@squares[4]}  | #{@squares[5]}   "
    puts "     |     |     |     |     "
    puts "-----+-----+-----+-----+-----"
    puts "     |     |     |     |     "
    puts "  #{@squares[6]}  |  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  | #{@squares[10]}   "
    puts "     |     |     |     |     "
    puts "-----+-----+-----+-----+-----"
    puts "     |     |     |     |     "
    puts "  #{@squares[11]}  |  #{@squares[12]}  |  #{@squares[13]}  |  #{@squares[14]}  |  #{@squares[15]}   "
    puts "     |     |     |     |     "
    puts "-----+-----+-----+-----+-----"
    puts "     |     |     |     |     "
    puts "  #{@squares[16]}  |  #{@squares[17]}  |  #{@squares[18]}  |  #{@squares[19]}  |  #{@squares[20]}   "
    puts "     |     |     |     |     "
    puts "-----+-----+-----+-----+-----"
    puts "     |     |     |     |     "
    puts "  #{@squares[21]}  |  #{@squares[22]}  |  #{@squares[23]}  |  #{@squares[24]}  |  #{@squares[25]}   "
    puts "     |     |     |     |     "
  end
  # rubocop:enable Metrics/AbcSize, Metrics/LineLength, Metrics/MethodLength:

  def five_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 5
    markers.min == markers.max
  end

  def at_least_three_identical_markers?(line)
    markers = @squares.values_at(*line).select(&:marked?).collect(&:marker)
    return false if markers.size < 3
    markers.min == markers.max
  end
end
