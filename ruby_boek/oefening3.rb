class Tijdstip
  attr_accessor :uren, :minuten, :seconden

  def initialize(uren, minuten, seconden)
    @uren = uren
    @minuten = minuten
    @seconden = seconden
  end

  def to_s
    '%.2d:%.2d:%.2d' % [@uren, @minuten, @seconden]
  end

  def volgend_uur
    @uren + 1 > 24 ? @uren = 1 : @uren += 1
  end

  def volgende_minuut
   @minuten + 1 > 60 ? @minuten = 1 : @minuten += 1
  end

  def volgende_seconde
    @seconden + 1 > 60 ? @seconden = 1 : @seconden += 1
  end

end

tijdstip1 =  Tijdstip.new(15, 6, 15)
puts tijdstip1
tijdstip1.volgend_uur
puts tijdstip1
tijdstip1.volgende_minuut
puts tijdstip1
tijdstip1.volgende_seconde
puts tijdstip1

tijdstip2 = Tijdstip.new(24, 10, 44)
puts tijdstip2
tijdstip2.volgend_uur
puts tijdstip2



