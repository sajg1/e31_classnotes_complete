def fizz_buzz(input)
 result = ""
  if ((input % 3) == 0)
    result += "Fizz"
    if ((input % 5) == 0)
      result += "Buzz"
    end
  elsif ((input % 5) == 0)
    result += "Buzz"
  else
    result += input.to_s
  end
  return result
end