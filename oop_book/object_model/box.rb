class Box
  BOX_COMPANY = "TATA Inc"
  BOXWEIGHT = 10

  def initialize(w, h)
    @width, @height = w, h
  end

  def get_area
    @width  * @height
  end
end

box = Box.new(10, 20)
a = box.get_area
puts "Area of the box is : #{a}"
puts Box::BOX_COMPANY
puts "Box weight is: #{Box::BOXWEIGHT}"
class Box
   # print class information
   puts "Type of self = #{self.type}"
   puts "Name of self = #{self.name}"
end
