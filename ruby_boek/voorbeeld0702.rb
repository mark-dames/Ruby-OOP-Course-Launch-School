class Team
  def initialize(sport, team_naam)
    @teamleden = []
    @sport = sport
    @team_naam = team_naam
  end

  def voeg_toe(lid)
    @teamleden << lid
  end

  def to_s
    s = "Team #{@team_naam}, #@sport\n"
    @teamleden.each { |lid| s << lid.to_s << "\n"}
    s
  end
end

#-----------------------------------
=begin rdoc
  = Toelichting
  De klasse student representeert een <b>student</b>.
  Instanties van Student worden in Team gebruikt om een sportteam te vormen.

  Author: Mark Dames
  Version: 1.0
=end
class Student
  attr_accessor :naam, :opleiding
  attr_accessor :geslacht, :nummer, :gebdat

  #  Initialiseert een Student met zijn/haar naam,
  #  opleiding, geslacht, nummernen de
  #  geboortedatum
  #
  #  Het attribuut geboortedatum is een instantie van Datum. 

  def initialize(naam, opleiding, geslacht, nummer, gebdat)
    @naam, @opleiding = naam, opleiding
    @geslacht, @nummer = geslacht, nummer
    @gebdat = gebdat
  end
  
  #Levert de attributen van Student af als string. 
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
student3 = Student.new('Jeannette', 'muziek', 'v', 233475, Datum.new(29, 7, 1989))
student4 = Student.new('Menno', 'informatica', 'm', 212364, Datum.new(6, 3, 1992))

team = Team.new('roeien', 'blauw')
team.voeg_toe(student1)
team.voeg_toe(student2)
team.voeg_toe(student3)
team.voeg_toe(student4)

puts team


#----------------------------------------------------------------------------

