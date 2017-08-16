class Datum
  attr_accessor :dag, :maand, :jaar
  
  def initialize(d, m ,j)
    @dag = d
    @maand = m
    @jaar = j
  end
end

d = Datum.new(31, 1, 2015)
puts '%02d-%02d-%4d' % [d.dag, d.maand, d.jaar]  

d.jaar = 1999
puts '%02d-%02d-%4d' % [d.dag, d.maand, d.jaar]

