numbers = (1..16).to_a

numbers.each do |n|
  print "#{n} "
  print "\n" if n % 4 == 0
end

numbers.each_slice(4) { |n| puts n.join(' ') }