class Artikel
  attr_reader :nummer, :omschrijving, :prijs

  def initialize(nr, omschr, prijs)
    @nummer, @omschrijving, @prijs = nr, omschr, prijs
  end
  
  def to_s
    '%4d %-21s %7.2f' % [@nummer, @omschrijving, @prijs]
  end
end

#-------------------------------------------------------
class Catalogus
  include Enumerable

  def initialize
    @lijst = []
  end

  def voeg_toe(artikel)
    @lijst << artikel
  end
  
  def each
    @lijst.each { |artikel| yield artikel }
  end
 
end

#---------------------------------------------------------
cat = Catalogus.new
cat.voeg_toe(Artikel.new(1, 'Ipod', 179.00))
cat.voeg_toe(Artikel.new(22, 'Hoofdtelefoon', 14.50))
cat.voeg_toe(Artikel.new(333, 'Acculader', 29.95))
cat.voeg_toe(Artikel.new(4444, 'Battarijen', 31.95))





