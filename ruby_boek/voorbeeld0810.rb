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

p 'each:'
cat.each { |art| puts art }


print 'all?:'
p cat.all? { |art| art.nummer > 0 }

print 'any?":'
is_er_333 = cat.any? { |art| art.nummer == 333 }
p is_er_333

p 'collect/map:'
arr_oms = cat.collect { |art| art.omschrijving }
p arr_oms

puts artikel_met_minimumprijs = cat.min { |a,b| a.prijs <=> b.prijs }

p op_prijs_gesorteerde_artikelen = cat.sort { |a,b| a.prijs <=> b.prijs }

puts minumumprijs = cat.min { |a,b| a.prijs <=> b.prijs }.prijs

puts artikel_met_laagste_nummer = cat.min { |a,b| a.nummer <=> b.nummer }




