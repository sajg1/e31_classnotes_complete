def greet( name, time_of_day )
  # greeting = "Hi " + name + ", good " + time_of_day
  greeting = "Hi #{ name }, good #{time_of_day}"

  return greeting
end

craigs_greeting = greet("Craig", "morning")
p craigs_greeting

second_name = "Louise"
p greet(second_name, "afternoon")

# def excited_greet()
#   p greeting
# end

# excited_greet()

def add( first_number, second_number )
  return first_number + second_number
end

p add(3, 6)
p add(8, 4)

def population_density( population, area )
  return population / area
end

p population_density(5373000, 77933)
