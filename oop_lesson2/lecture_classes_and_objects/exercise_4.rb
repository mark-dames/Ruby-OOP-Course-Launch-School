class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    set_first_last_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    set_first_last_name(full_name)
  end

  def to_s
    name
  end

  private

  def set_first_last_name(full_name)
    @first_name, @last_name = full_name.split(' ')
    @last_name = '' if @last_name == nil
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob.name == rob.name #return true or false. we compare two string objects

puts "The person's name is: #{bob}"
