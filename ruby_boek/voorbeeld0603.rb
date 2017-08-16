class Student
  def initialize(naam, opleiding, geslacht, nummer)
    @naam, @opleiding = naam, opleiding
    @geslacht, @nummer = geslacht, nummer
  end
  
  #getter methods
  def naam
    @naam
  end

  def opleiding
    @opleiding
  end

  def geslacht
    @geslacht
  end

  def nummer
    @nummer
  end

  #setter methods
  def naam=(naam)
    @naam = naam
  end

  def opleiding=(opleiding)
    puts @opleiding.object_id
    @opleiding = opleiding
    puts @opleiding.object_id
  end

  def geslacht=(geslacht)
    @geslacht = geslacht
  end

  def nummer=(nummer)
    @nummer = nummer
  end
end

student1 = Student.new('Jasna', 'Wiskunde', 'v', 200891)

print "#{student1.naam}, #{student1.geslacht}, "
puts "#{student1.nummer}, #{student1.opleiding}"

student1.opleiding = 'Informatica'
student1.nummer = 200766

puts 'Herstel'
print "#{student1.naam} , #{student1.geslacht}, "
puts "#{student1.nummer}, #{student1.opleiding}"



