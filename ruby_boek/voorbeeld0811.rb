class Artikel
  include Comparable
  attr_reader :nummer, :omschrijving, :prijs

  def initialize(nr, omschr, prijs)
    @nummer, @omschrijving, @prijs = nr, omschr, prijs
  end

  def <=>(art)
    self.prijs <=> art.prijs
  end

  def to_s
    '%4d %-21s %7.2f' % [@nummer, @omschrijving, @prijs]
  end
end

art1 = Artikel.new(1, 'tafel', 350.00)
art2 = Artikel.new(2, 'stoel', 75.00)
art3 = Artikel.new(3, 'tv', 475.00)
art4 = Artikel.new(3, 'koelkast', 475.00)

puts art1 < art2
puts art3 == art4
puts art1.between?(art2, art3)
