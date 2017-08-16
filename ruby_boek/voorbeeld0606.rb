class Datum
  attr_accessor :dag, :maand, :jaar

  def initialize(d = 1, m = 1, j = 1900)
    @dag = d
    @maand = m
    @jaar = j
  end

  def to_s
    '%02d-%02d-%4d' % [@dag, @maand, @jaar]
  end
end

d = Datum.new
puts d

d.jaar = 2015
puts d


