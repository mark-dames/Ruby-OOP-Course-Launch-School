class Bestelling
  attr_accessor :winkelmandje

  def initialize
    @winkelmandje = []
  end

  def voeg_toe(artikel)
    @winkelmandje << artikel
  end

  def print_factuur
    puts "Uw factuur:"
    @winkelmandje.each do |artikel|
      puts artikel
    end
  end
end


class Artikel
  attr_reader :nummer

  def initialize(nummer, omschrijving, prijs)
    @nummer = nummer
    @omschrijving = omschrijving
    @prijs = prijs
  end

  def to_s
    "#{@nummer}, #{@omschrijving}, #{@prijs}"
    '%4d %-21s €%7.2f' % [@nummer, @omschrijving, @prijs]
  end
end

class Catalogus
  def initialize
    @lijst = []
    @lijst << Artikel.new(1, 'IPod', 179.00)
    @lijst << Artikel.new(22, 'Hoofdtelefoon', 14.50)
    @lijst << Artikel.new(333, 'Acculader', 29.95)
    @lijst << Artikel.new(44444, '4 Ni-MH batterijen', 31.95)
  end

  def voeg_toe(artikel)
    @lijst << artikel
  end

  def print
    puts "Catalogus"
    @lijst.each { |artikel| puts artikel }
  end

  def zoek(nummer)
    @lijst.find { |artikel| artikel.nummer == nummer }
  end
end

bestelling = Bestelling.new
bestelling.voeg_toe(Artikel.new(1, 'IPod', 179.00))
bestelling.print_factuur

