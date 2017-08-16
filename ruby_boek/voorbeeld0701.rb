class Team
  def initialize(lid1, lid2)
    @lid1, @lid2 = lid1, lid2
  end

  def to_s
    "Team: 
      #{@lid1}
      #{@lid2}
    "
  end
end

#-----------------------------------
class Student
  attr_accessor :naam, :opleiding
  attr_accessor :geslacht, :nummer, :gebdat

  def initialize(naam, opleiding, geslacht, nummer, gebdat)
    @naam, @opleiding = naam, opleiding
    @geslacht, @nummer = geslacht, nummer
    @gebdat = gebdat
  end

  def to_s
    "#{@naam} (#{@geslacht}, #{@nummer}, geb #{@gebdat}, #{@opleiding})"
  end
end

#--------------------------------------------------------------------------
class Datum
  attr_accessor :dag, :maand, :jaar

  def initialize(d = 1, m = 1, j = 1900)
    @dag, @maand, @jaar = d, m , j
  end

  def to_s
    '%02d-%02d-%4d' % [@dag, @maand, @jaar]
  end
end

#---------------------------------------------------------------------------
student1 = Student.new('Elana', 'wiskunde', 'v', 201053, Datum.new(13, 5, 1990))
student2 = Student.new('Lucia', 'Engels', 'v', 227756, Datum.new(16, 4, 1991))

team = Team.new(student1, student2)
puts team
#----------------------------------------------------------------------------

