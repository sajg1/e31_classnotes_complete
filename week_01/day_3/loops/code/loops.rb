chickens = [
  { name: "Margaret", age: 2, eggs: 0 },
  { name: "Hetty", age: 1, eggs: 2 },
  { name: "Henrietta", age: 3, eggs: 1 },
  { name: "Audrey", age: 2, eggs: 0 },
  { name: "Mabel", age: 5, eggs: 1 },
]

total_eggs = 0
for chicken in chickens
  if (chicken[:eggs] > 0)
    p "woo-hoo eggs!"
  end
  total_eggs += chicken[:eggs]
  chicken[:eggs] = 0
end

p "#{total_eggs} eggs collected"
p chickens

# for chicken in chickens
#   p "#{chicken[:name]} is #{chicken[:age]}"
# end

# chicken_names = ["Margaret", "Hetty", "Henrietta", "Audrey", "Mabel"]
#
# for chicken_name in chicken_names
#   p chicken_name
# end

# numbers = [1, 2, 3, 4, 5]
# total = 0
#
# for number in numbers
#   #p number * 3
#   total += number
# end
# p total

# counter = 0
# my_number = 5
#
# while (counter < my_number)
#   p "counter is #{counter}"
#   counter += 1
# end
