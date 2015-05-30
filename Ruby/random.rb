number = rand(10) + 1
guess = 0

while guess != number do
  puts "Pick a number from 1-10:"
  guess = gets.chomp.to_i
  puts "Higher." if guess < number
  puts "Lower." if guess > number
end
puts "You got it."