class AngryCat
  def initialize(name, age)
    @name = name
    @age = age
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!"
  end
end

cat1 = AngryCat.new('Oliver', 8)
cat2 = AngryCat.new('Sandra', 12)
p cat1
p cat2
cat1.name
cat1.age
cat2.name
cat2.age
