class Person
  def initialize(name)
    @name = name
  end

  private
  def message
    "Hello #{self.name}!"
  end
end

bob = Person.new
