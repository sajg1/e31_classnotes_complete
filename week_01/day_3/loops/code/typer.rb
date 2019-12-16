
while (true)
  p "type something:"
  line = gets.chomp()

  if (line.downcase == 'q')
    break
  end

  p "you typed: #{line}"

end

p "Exiting..."
