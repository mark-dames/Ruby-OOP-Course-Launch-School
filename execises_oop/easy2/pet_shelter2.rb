class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    pets.each { |pet| puts pet }
  end
end

class Shelter
  attr_reader :unadopted_pets

  def initialize
    @owners = {}
    @unadopted_pets = []
  end

  def add_to_shelter(pet)
    unadopted_pets << pet
  end

  def adopt(owner, pet)
    if !unadopted_pets.include?(pet)
      puts "This pet is already taken."
    else
      owner.add_pet(pet)
      unadopted_pets.delete(pet)
      @owners[owner.name] ||= owner
    end
  end

  def print_adoptions
    @owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts ""
    end
  end

  def number_of_unadopted_pets
    unadopted_pets.size
  end

  def print_unadopted_animals
    puts "The Animal Shelter has the following unadopted animal:"
    unadopted_pets.each { |pet| puts pet }
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
janny        = Pet.new('cat', 'Janny')
zoe          = Pet.new('Cavia', 'Zore')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.add_to_shelter(butterscotch)
shelter.add_to_shelter(pudding)
shelter.add_to_shelter(darwin)
shelter.add_to_shelter(kennedy)
shelter.add_to_shelter(sweetie)
shelter.add_to_shelter(molly)
shelter.add_to_shelter(chester)
shelter.add_to_shelter(janny)
shelter.add_to_shelter(zoe)
shelter.print_unadopted_animals

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
shelter.print_unadopted_animals
