class SMS
  attr_reader :naar

  def initialize(van, naar, tekst)
    @van, @naar, @tekst = van , naar , tekst
  end

  def to_s
    "SMS van #@van naar #@naar: #@tekst"
  end
end

class Provider
  def initialize
    @lijst = []
    0.upto(9) { |nr| @lijst << Mobiel.new(self, nr) }
  end

  def get_mobiel(nr)
    @lijst.find { |mobiel| mobiel.telnr == nr }
  end

  def verwerk_bericht(sms)
    nr = sms.naar
    doel = get_mobiel(nr)
    doel.ontvang(sms)
  end
end

class Mobiel
  attr_reader :sms, :telnr

  def initialize(provider, telnr)
    @provider, @telnr = provider, telnr
  end

  def ontvang(sms)
    @sms = sms
  end

  def verzend(tekst, naar)
    @provider.verwerk_bericht(SMS.new(@telnr, naar, tekst))
  end

  def to_s
    "nr = #@telnr"
  end
end

telecom = Provider.new
mob1 = telecom.get_mobiel( 1 )
mob9 = telecom.get_mobiel( 9 )

mob1.verzend( 'Ik ga nu van huis', 9 )
puts mob9.sms

mob9.verzend( 'Ok, ik wacht op je', 1 )
puts mob1.sms

