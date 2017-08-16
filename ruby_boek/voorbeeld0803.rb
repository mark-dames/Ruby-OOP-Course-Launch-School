class Betaalrekening
  attr_reader :rekeningnummer, :saldo

  def initialize(rekeningnr, saldo = 0.0 )
    @rekeningnr, @saldo = rekeningnr, saldo
  end

  def neem_op(bedrag)
    saldo -= bedrag
  end

  def stort(bedrag)
    saldo += bedrag
  end

  def to_s
    "Betaalrekeningnr #@rekeningnr " +
    "Saldo = %.2f" % @saldo
  end
end

class Spaarrekening
  attr_reader :rekeningnr, :saldo, :renteperc

  def initialize(rekeningnr, percentage, saldo = 0.0 )
    @rekeningnr, @renteperc, @saldo = rekeningnr, percentage, saldo
  end

  def neem_op(bedrag)
    saldo -= bedrag
  end

  def stort(bedrag)
    saldo += bedrag
  end

  def schrijf_rente_bij
    rentebedrag = @saldo * @renteperc / 100.0
    @saldo + rentebedrag
  end

  def to_s
    "Spaarrekeningnr #@rekeningnr " + 
    "Saldo = %.2f\n" % @saldo +
    "Rente = %.1f%" % @renteperc
  end
end

betaalrek = Betaalrekening.new(3333, 100)
puts betaalrek
puts
spaarrek = Spaarrekening.new(1234, 2.4, 50)
spaarrek.schrijf_rente_bij
puts spaarrek


