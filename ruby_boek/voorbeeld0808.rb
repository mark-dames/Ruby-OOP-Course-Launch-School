p 3.class
p 3.class.superclass
p 3.class.superclass.superclass
p 3.class.superclass.superclass.superclass
p 3.class.superclass.superclass.superclass.superclass

c = 3.class
while c
  p c
  c = c.superclass
end

