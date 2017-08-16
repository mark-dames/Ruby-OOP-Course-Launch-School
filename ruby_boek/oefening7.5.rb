class Rapport
  attr_accessor :cijfer_lijst, :naam_leerling

  def initialize(naam_leerling)
    @cijfer_lijst = {}
    @naam_leerling = naam_leerling
  end

  def voeg_cijfer_toe(vak, cijfer)
    @cijfer_lijst[vak] = cijfer
  end

  def print_cijferlijst
    puts "Cijferlijst van #{@naam_leerling.naam}: "
    @cijfer_lijst.each do |vak, cijfer|
      puts "Voor #{vak} heb je een #{cijfer} gehaald."
    end
  end
end

class Leerling
  attr_reader :naam

  def initialize(naam)
    @naam = naam
  end
end

mark = Leerling.new('Mark Dames')
john = Leerling.new('John de Boer')

puts mark.naam
puts john.naam

rapport = Rapport.new(mark)
rapport.voeg_cijfer_toe('wiskunde', 8)
rapport.voeg_cijfer_toe('duits', 7)
rapport.voeg_cijfer_toe('nederlands', 9)
rapport.voeg_cijfer_toe('natuurkunde', 1)

rapport.print_cijferlijst




