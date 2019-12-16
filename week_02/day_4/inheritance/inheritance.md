# Inheritance

## Learning Objectives

- Be able to describe inheritance
- Implement superclass and subclass
- Know how to override methods


Sometimes we might have a bunch of classes that all share some behaviour. For example, a sparrow can fly, but so can a crow.

A car has wheels, but so does a motorbike - they also both help you travel somewhere, and both have an engine that can start.

How can we represent this in our code?

```bash
#terminal

touch car.rb motorbike.rb
mkdir specs
touch specs/car_spec.rb specs/motorbike_spec.rb

atom .
```

> Maybe draw a class diagram and update it as you go along

```ruby
# car_spec.rb
require('minitest/autorun')
require('minitest/rg')
require_relative('../car')

class TestCar < Minitest::Test
  def setup
    @car = Car.new()
  end

  def test_car_can_start_engine
    assert_equal("Vrrmmm", @car.start_engine)
  end

end
```

```ruby
# car.rb
class Car
  def start_engine
    return "Vrrmmm"
  end
end
```

Now if we want to make a motorbike that also starts its engine what do we do? The simplest solution is that we can copy and paste the code.

```ruby
# motorbike_spec.rb

require('minitest/autorun')
require('minitest/rg')
require_relative('../motorbike')

class TestMotorbike < Minitest::Test
  def setup
    @motorbike = Motorbike.new()
  end

  def test_motorbike_can_start_engine
    assert_equal("Vrrmmm", @motorbike.start_engine)
  end
end
```

```ruby
# motorbike.rb
class Motorbike
  def start_engine
    return "Vrrmmm"
  end
end
```

This is dirty. We want to be able to reuse our code.

If we change this method we need to alter it in two places. We can move this to a "super class" where the behaviour can be shared among the two "sub classes".

```bash
# terminal

touch vehicle.rb
```

```ruby
# vehicle.rb
class Vehicle
  def start_engine
    return "Vrrmmm"
  end
end
```

```ruby
# vehicle_spec.rb
require('minitest/autorun')
require('minitest/rg')
require_relative('../vehicle.rb')

class TestVehicle < Minitest::Test
  def setup
    @vehicle = Vehicle.new()
  end

  def test_vehicle_can_start_engine
    assert_equal("Vrrmmm", @vehicle.start_engine)
  end
end
```

```ruby
# car.rb
require_relative('vehicle')
class Car < Vehicle

end
```

```ruby
# motorbike.rb
require_relative('vehicle')
class Motorbike < Vehicle

end
```

Our tests still pass. This is as if the two classes are joined together - the behaviour is passed down to the subclass. This is called "inheriting" properties or behaviours.

Another way to think of the relationship between these classes is that a `Car` __IS_A__ `Vehicle`, and a `Motorbike` also __IS_A__ vehicle. Inheritance is what we use to implement an __IS_A__ relationship between classes

> think of other examples from the real world e.g animals - e.g. an eagle is a bird, a bird is an animal etc

## Overriding

If we declare a method with the same name in a subclass that is shared with a parent, we override it.  Ruby first looks to the class, and then the super class.  Let's change the motorbike so it has specific behaviour.

```ruby
# motorbike_spec.rb

class MotorbikeTest < MiniTest::Test
	def setup
    @motorbike = Motorbike.new()
  end

  def test_motorbike_can_start_engine
    assert_equal("Vrrmmm (I'm a motorbike), HELL YEAH!", @motorbike.start_engine)
  end
end
```

```ruby
# motorbike.rb

class Motorbike
	def start_engine
    return "Vrrmmm (I'm a motorbike), HELL YEAH!"
  end
end
```


## The Problem with inheritance...

This inheritance stuff seems pretty useful. However if we use it too much it can sometimes be limiting, or make us write our code in a convoluted way. For example, imagine we want to make a Bicycle class. Surely this should inherit from Vehicle - it does transport people around, and it does have wheels. However it doesn't have an engine, so inheriting a start_engine method is a bit of a problem.. what are some solutions?

- Overwrite the start_engine to just return 'I don't have an engine'
- Remove start_engine from vehicle and put it back on Car and Motorbike
- Add another layer of inheritance to have 'EnginedVehicles' and 'HumanPoweredVehicles'

... all of these are a bit nasty. This is where we come onto composition as an alternative way of structuring our programs.

