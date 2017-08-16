class Dog
  def self.life_purpose
    "serve master"
  end
end

p Dog.singleton_methods
a = Dog.new
p a.singleton_methods
