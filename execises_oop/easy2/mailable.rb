module Mailable
  def print_adress
    puts "#{name}"
    puts "#{adress}"
    puts "#{city}, #{state}, #{zipcode}"
  end
end

class Customer
  include Mailable

  attr_reader :name, :adress, :city, :state, :zipcode
end

class Employee
  include Mailable

  attr_reader :name, :adress, :city, :state, :zipcode
end

betty = Customer.new
bob = Employee.new
betty.print_adress
bob.print_adress
