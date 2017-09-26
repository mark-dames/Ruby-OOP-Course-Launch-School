class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

#What is the result of the following:
trip = RoadTrip.new
puts trip.predict_the_future

=begin
When we call predict_the_future , we call choices instance method.
With a method call , first Ruby looks in the RoadTrip class itself
for the choices method, finds it and executed it. In this case
it not looks in the superclass. choices return an array and sample
returns eiter of the strings. 
=end

