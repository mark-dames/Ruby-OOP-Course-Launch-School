require_relative 'administratie'
require_relative 'catalogus'

artikel = Artikel.new(3, 'zeep', 1.49)
datum = Administratie::Datum.new(14, 11, 1990)
student = Administratie::Student.new('Kees', 'techniek', datum)

File.open('objectendump', 'w') do |f|
  Marshal.dump(artikel, f)
  Marshal.dump(student, f)
end

artikel = student = nil
File.open('objectendump') do |f|
  artikel = Marshal.load(f)
  student = Marshal.load(f)
end

puts artikel
puts student

