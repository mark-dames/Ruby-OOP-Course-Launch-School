class Dobbelsteen
  @@aantal = 0
  @@totaal_aantal_ogen = 0

  def initialize
    @@aantal += 1
  end

  def gooi
    worp = rand(6) + 1
    @@totaal_aantal_ogen += worp
    worp
  end

 def self.vertel
  puts "Aantal dobbelstenen = #{@@aantal}"
  if @@totaal_aantal_ogen != 0
    print 'Gemiddelde worp = '
    puts @@totaal_aantal_ogen.to_f / @@aantal
  end
 end
end

d1 = Dobbelsteen.new
d2 = Dobbelsteen.new
d3 = Dobbelsteen.new

puts d1.gooi
puts d2.gooi
puts d3.gooi

Dobbelsteen.vertel
