require_relative 'catalogus'
require 'yaml'

cat = Catalogus.new
cat.voeg_toe(Artikel.new(3, 'zeep', 1.49))
cat.voeg_toe(Artikel.new(4, 'tandpasta', 1.79))
cat.voeg_toe(Artikel.new(5, 'doucheschuim', 2.95))
cat.voeg_toe(Artikel.new(6, 'bleekwater', 0.95))

File.open('yamldump.yaml', 'w') do |f|
  YAML::dump(cat, f)
end

