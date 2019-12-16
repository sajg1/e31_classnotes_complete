chickens = [
  { name: "Margaret", age: 2, eggs: 0 },
  { name: "Hetty", age: 1, eggs: 2 },
  { name: "Henrietta", age: 3, eggs: 1 },
  { name: "Audrey", age: 2, eggs: 0 },
  { name: "Mabel", age: 5, eggs: 1 },
]

def count_eggs(array)
  total_eggs = 0
  for bird in array
    total_eggs += bird[:eggs]
    bird[:eggs] = 0
  end
  return "#{total_eggs} eggs collected"
end

p count_eggs(chickens)

def find_bird_by_name(array, name)
  for bird in array
    if (bird[:name] == name)
      #return "I found #{name}"
      return bird
    end
  end
  return "Not found"
end

result1 = find_bird_by_name(chickens, "Audrey")
result2 = find_bird_by_name(chickens, "Hetty")
p result1
p result2
result3 = find_bird_by_name(chickens, "Elsie")
p result3
