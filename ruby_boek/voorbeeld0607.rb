class Student
  attr_accessor :naam, :opleiding
  attr_accessor :geslacht, :nummer, :gebdat

  def initialize(naam, opleiding, geslacht, nummer, gebdat)
    @naam, @opleiding = naam, opleiding
    @geslacht, @nummer = geslacht, nummer
    @gebdat = gebdat
  end

  def to_s
    "#@naam (#@geslacht, #@nummer, geb #@gebdat)" +
    " studeert #@opleiding"
  end
end

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

student = Student.new('Elana', 'wiskunde', 'v', 201053, Datum.new(13, 5, 1990))
puts student



