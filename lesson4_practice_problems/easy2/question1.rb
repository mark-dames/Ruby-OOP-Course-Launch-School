class Oracle
  def predict_the_future
    "you will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new #create an instance of the Oracle class
oracle.predict_the_future

=begin
  What is the result of calling above code
  When we call oracle.predict_the_future, we concatenate
  "You will " with the result of calling the choices instance
  method, which returns the array object and on that return value
  we call .sample method which returns either of the three sentences
  that return value is used for concatenate to " you will "
=end
