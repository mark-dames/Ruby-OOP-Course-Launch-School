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

  private

  def set_first_last_name(full_name)
    @first_name, @last_name = full_name.split(' ')
    @last_name = '' if @last_name == nil
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name 
p bob.name
