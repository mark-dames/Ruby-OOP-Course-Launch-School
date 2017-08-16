require_relative 'catalogus'
require 'yaml'

cat = nil
File.open('yamldump.yaml') do |f|
  cat = YAML.load(f)
end

cat.each { |artikel| puts artikel }
