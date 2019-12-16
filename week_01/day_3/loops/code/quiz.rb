my_number = 5

p "What number am I thinking of?"
value = gets.chomp.to_i()

while (value != my_number)
  if (value > my_number)
    p "too high"
  else
    p "too low"
  end
  p "nope! try again..."
  value = gets.chomp.to_i()
end

p "yes!"
