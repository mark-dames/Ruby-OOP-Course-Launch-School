require_relative 'kassa'

kassa = Kassa.new

puts 'Voer een bedrag in, 0 is stoppen'
bedrag = 0
while (bedrag = gets.to_f) != 0
  kassa.tel_op(bedrag)
  puts 'Voer een bedrag in, 0 is stoppen'
end

puts "Het totaal is #{kassa}"


