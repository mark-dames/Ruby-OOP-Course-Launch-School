class Person
  def initialize(first_name, last_name)
    @first_name = capitalize_name(first_name)
    @last_name = capitalize_name(last_name)
  end

  def first_name=(new_first_name)
    @first_name = capitalize_name(new_first_name)
  end

  def last_name=(new_last_name)
    @last_name = capitalize_name(new_last_name)
  end

  def capitalize_name(name)
    name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person
person.first_name = 'jane'
person.last_name = 'smith'
puts person
