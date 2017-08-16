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

puts 'Hoeveel wilt u opnemen??'
uw_bedrag = gets.to_f

rekening.neem_op(uw_bedrag)
puts "Uw saldo is #{rekening.saldo}"
