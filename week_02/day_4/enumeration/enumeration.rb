chickens = ['Margaret', 'Hetty', 'Henrietta', 'Audrey', 'Mabel']

# chickens = nil

for chicken in chickens
  # p chicken
end

chickens.each() do | chicken |
  angry_chicken = chicken.upcase()
  # p angry_chicken
end

# chickens.each() { |chicken| p chicken }

angry_chickens = chickens.map do | chicken |

  chicken.upcase()
end

chicken_lengths = chickens.map {|chicken| chicken.length() }

useless_map = chickens.map do |chicken|
  two = 1 + 1
  four = 2 + two
  four
end

chickens.each_with_index do |chicken, index|
  # p "At index #{index}, I found #{chicken}"
end

found_item = chickens.find do |chicken|
  chicken[0] == 'H'
  # p chicken
  # have_we_found_it = chicken[0] == 'H'
  # p have_we_found_it
  # have_we_found_it
end

# p found_item

found_items = chickens.find_all do |chicken|
  chicken[0] == 'H'
end

# p found_items

found_items = []

for chicken in chickens
  if chicken[0] == 'H'
    found_items.push(chicken)
  end
end
# p found_items

string_list = chickens.reduce do |list, chicken|
  list + ", " + chicken
end

# p string_list

numbers = [1, 2, 3, 5, 4]

total = numbers.reduce do |running_total, number|
  running_total + number
end
p total

numbers_as_strings = ['1', '2', '3', '4', '5']

total = numbers_as_strings.reduce(0) do |running_total, number|
  running_total + number.to_i()
end
p total
