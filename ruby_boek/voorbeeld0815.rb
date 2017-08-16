require_relative 'catalogus'

cat = nil
File.open('catdump') do |f|
  cat = Marshal.load(f)
end

cat.each { |artikel| puts artikel }

