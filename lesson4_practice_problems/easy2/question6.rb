class Television
  def self.manufacturer
  end

  def model
  end
end

Television.manufacturer

#Which one of these is a class method (if any) and how do you know? How would you call a class method?
=begin
The method self.manufacturer is a class method. We know that because the method is prefixed with self.
self refer to the class itself, in this case the Television class.
We can call it like: Television.manufacturer
=end
