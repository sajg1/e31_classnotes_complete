p "What animal are you?"
animal = gets.chomp.downcase

if animal == "chicken"
  p "This is my favourite animal!"
elsif animal == "kitten"
  p "I love kittens!"
else
  p "Sad, not my favourite."
end
