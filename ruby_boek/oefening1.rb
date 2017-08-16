class Bankrekening

  def initialize(nummer, naam, saldo)
    @nummer, @naam, @saldo = nummer, naam, saldo
  end

  def stort(bedrag)
    @saldo += bedrag
  end

  def neem_op(bedrag)
      @saldo -= bedrag
      bedrag
  end

  def saldo
    @saldo
  end
end

puts 'Voer u naam in '
uw_naam = gets.chomp

rekening = Bankrekening.new(400, uw_naam, 0.0)

puts "Er is een nieuwe rekeninge gemaakt voor #{uw_naam}"
puts 'Hoveel wilt u storten?'
uw_bedrag = gets.to_f

rekening.stort(uw_bedrag)

puts "Uw saldo is #{rekening.saldo}"

uw_bedrag = 0
loop do
  puts 'Hoeveel wilt u opnemen?'
  uw_bedrag = gets.to_f
  if uw_bedrag > rekening.saldo
    puts "You can't get this amount. You can get max #{rekening.saldo} from your account."
  else
    rekening.neem_op(uw_bedrag)
    break
  end
end

puts "Uw saldo is #{rekening.saldo}"
