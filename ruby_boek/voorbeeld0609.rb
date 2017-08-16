class Voorraad
  attr_reader :naam, :groot, :klein

  def initialize(naam = '', groot = 0, klein = 0)
    @naam = naam
    @groot = groot
    @klein = klein
  end

  def to_s
   "Voorraad van #@naam is #@groot groot en #@klein klein"
  end

  def +(v)
    Voorraad.new(self.naam + ' en ' + v.naam,
                 self.groot + v.groot,
                 self.klein + v.klein )
  end

  def *(getal)
    Voorraad.new(self.naam,
                 self.groot * getal,
                 self.klein * getal )
  end
end

voorraad1 = Voorraad.new('Punselie', 23, 37)
voorraad2 = Voorraad.new('Bint', 44, 52)
puts voorraad1 + voorraad2

voorraad3 = Voorraad.new('Keska', 15, 20)
puts dubbel_v = voorraad3.*(2)
puts dubbel_v



