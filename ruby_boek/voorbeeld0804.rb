class Rekening
  attr_reader :rekeningnr , :saldo

  def initialize(rekeningnr, saldo = 0.0)
    @rekeningnr, @saldo = rekeningnr, saldo
  end

  def neem_op(bedrag)
    saldo -= bedrag
  end

  def stort(bedrag)
    saldo += bedrag
  end

  def to_s
    "rekeningnr #{@rekeningnr}, saldo = %.2f" % saldo
  end
end#rekening

class Betaalrekening < Rekening
  def to_s
    "Betaalrekening, " + super
  end
end#Betaalrekening

class Spaarrekening < Rekening
  attr_reader :renteperc

  def initialize(rekeningnr, percentage, saldo = 0.0)
    super(rekeningnr, saldo)
    @renteperc = percentage
  end

  def schrijf_rente_bij
    rentebedrag = @saldo * @renteperc / 100.0
    @saldo += rentebedrag
  end

  def to_s
    "Spaarrekening, " + super + ", rente = %.1f%" % @renteperc
  end
end#Spaarrekening 

betaalrek = Betaalrekening.new(3333, 100)
spaarrek = Spaarrekening.new(1234, 2.4, 50)
spaarrek.schrijf_rente_bij
puts betaalrek
puts spaarrek

