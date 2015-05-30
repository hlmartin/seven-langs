def grep(file, target)
  File.open(file, 'r') do |file|
    file.each.with_index { |line, index| puts "#{index + 1}: #{line}" if line.include?(target) }
  end
end

grep('celts.txt', 'culture')