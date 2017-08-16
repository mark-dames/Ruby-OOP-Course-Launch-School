require_relative 'administratie'

puts 'Versie ' + Administratie::VERSIE
puts Administratie.to_text

datum = Administratie::Datum.new(31, 1, 1985)
student = Administratie::Student.new('Gertjan', 'wiskunde', datum)

puts student
