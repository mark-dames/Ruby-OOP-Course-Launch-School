class Student
  attr_accessor :naam, :opleidng, :geslacht, :nummer

  def initialize(naam, opleidng, geslacht, nummer)
    @naam, @opleidng = naam, opleidng
    @geslacht, @nummer = geslacht, nummer
  end
  
  def to_s
    "#@naam, #@geslacht, #@nummer studeert #@opleidng"
  end
end

student2 = Student.new('Miza', 'geschiedenis', 'v', 201053)
puts student2

student2.geslacht = 'm'

puts 'Herstel'
puts student2


