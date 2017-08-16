module Hulp
  def gooi_dobbelsteen
    rand(6) + 1
  end
end

class Spel
  include Hulp

  def gooi3
    [gooi_dobbelsteen, gooi_dobbelsteen, gooi_dobbelsteen]
  end
end

spel = Spel.new
5.times  { p spel.gooi3 }
