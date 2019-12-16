# meals = ['eggs', 'choclate', 'peppers', 'lasagne', 'crisps']
# p meals[2]

my_first_hash = {}
my_first_hash = Hash.new()

meals = {
  'breakfast' => 'eggs',
  'lunch' => 'peppers',
  'dinner' => 'lasagne'
}

silly_hash = {1 => 'one', '5' => 3.4}

# p meals['breakfast']
# p meals['supper']

meals['supper'] = 'apple'

meals['lunch'] = 'cake'

# p meals
#
# p meals.keys()
# p meals.values()

meals = {
  breakfast: 'eggs',
  lunch: 'cake',
  dinner: 'lasagne'
}

old_breakfast = meals[:breakfast]
meals.delete(:breakfast)
meals[:morning_eats] = old_breakfast
# p meals

# p meals['breakfast']
# p meals[:breakfast]

countries = {
  uk: {
    capital: 'London',
    population: 65000000
  },
  germany: {
    capital: 'Berlin',
    population: 80000000
  }
}

germany_hash = countries[:germany]
population_of_germany =  germany_hash[:population]

# p countries[:germany][:population]

avengers = {
  ironman: {
    name: "Tony Stark",
    moves: {
      punch: 10,
      kick: 100
    }
  },
  hulk: {
    name: "Bruce Banner",
    moves: {
      smash: 1000,
      roll: 500
    }
  }
}

p avengers[:hulk][:moves][:smash]
