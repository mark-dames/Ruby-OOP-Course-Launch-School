class Kassa
  attr_reader :totaal

  def initialize
    @totaal = 0
  end

  def tel_op(bedrag)
    @totaal += bedrag
  end

  def to_s
    "%.2f" % totaal
  end
end


