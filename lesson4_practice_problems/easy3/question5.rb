class Television
  def self.manufacturer
  end

  def model
  end
end

#What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer #raises an undifined mehtod error. Can't call a class method on an object.
tv.model #works, because model is an instance method. We call it on an instance of the class.

Television.manufacturer #works, because we it is a class method and we call in on the class itself.
Television.model #raises an undifined method error, we can't call instance methods on a class.
