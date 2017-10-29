class Pet
  attr_reader :name, :type

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name
  attr_reader :adopted_pets

  def initialize(name)
    @name = name
    @adopted_pets = []
  end

  def number_of_pets
    adopted_pets.size
  end
end

class Shelter
  attr_reader :adoptions
  attr_reader :unadopted_pets

  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet)
    adoptions[owner] = owner.adopted_pets << pet
  end

  def print_adoptions
    adoptions.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"
      pets.each { |pet| puts pet }
      puts ""
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding = Pet.new('cat', 'Pudding')
darwin = Pet.new('bearded dragon', 'Darwin')
kennedy = Pet.new('dog', 'Kennedy')
sweetie = Pet.new('parakeet', 'Sweetie Pie')
molly = Pet.new('dog', 'Molly')
chester = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
