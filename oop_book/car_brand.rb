class Student
  attr_accessor :name
  attr_reader :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def <=>(other_grade.grade)
  end
end

student1 = Student.new('Mark', 5)
student2 = Student.new('Katarina', 5)

puts student1.<=>(student2)
