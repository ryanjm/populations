require_relative 'lib/setup'

s = Setup.new
s.areas.first(5).each do |area|
  puts area
end
