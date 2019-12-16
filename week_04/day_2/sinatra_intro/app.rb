require('sinatra')
require('sinatra/contrib/all')

get('/hello') do
  p('Hello World!')
  'My website content goes here ❤️'
end

get '/roll-die' do
  "You rolled a #{rand(1..6)}"
end

get '/hello/:first_name/:last_name' do
  first = params['first_name']
  last = params['last_name']

  "Hello there #{first} #{last}!!"
end


get '/friends/new/:new_friend_name' do
  friend = params['new_friend_name']

  "Yay, a new friend! It's #{friend}"
end


get '/friends/:id/:name' do
  friends = [
    'Joey',
    'Chandler',
    'Rachel',
    'Phoebe',
    'Monica',
    'Ross'
  ]
  index = params['id'].to_i() - 1
  friends[index]
end
