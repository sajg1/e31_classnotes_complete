craig_hungry = true
craig_tired = true

if (craig_hungry && craig_tired)
  p "Craig is hangry!"
end

craig_tired = false
if (craig_hungry || craig_tired)
  p "Craig is grumpy!"
end
