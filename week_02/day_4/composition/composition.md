## Composition

## Learning Objectives

- Be able to describe composition
- Understand why to favour composition over inheritance

# Intro

When we looked at inheritance when creating an object we were thinking about what an object __IS__ e.g. a `Car` __IS_A__ `Vehicle. 

As well as thinking about what something __IS__, we can also think about what something __HAS__ e.g. a car __HAS__ an engine, a car __HAS__ a gearbox. So our car is made up of, or ***COMPOSED*** of other objects, each with their own state and behaviour.

> maybe draw a class diagram of the following

```ruby
#engine.rb

class Engine
  def start()
    return "Vrrrrmmm!"
  end
end
```

```ruby
#gearbox.rb

class Gearbox
  attr_reader :type, :number_of_gears, :current_gear

  def initialize(type,number_of_gears)
    @type = type
    @number_of_gears = number_of_gears
    @current_gear = "N"
  end

  def change_gear(gear)
    @current_gear = gear
  end
end
```

```ruby
#car.rb

class Car
  attr_reader :make, :model
  attr_accessor :engine, :gearbox
  
  def initialise(make, model, engine, gearbox)
    @make = make
    @model = model
    @engine = engine
    @gearbox = gearbox
  end
end
```

### Composition and Behaviours

When we are thinking about what a Car does, i.e. its behaviour, we can think about what it HAS to carry out that behaviour i.e. an Engine, rather than what it IS that gives us that behaviour e.g. a `drive` method in a `Vehicle` superclass.

So in our `Car` example, if we want the car to accelerate we can ask ourselves what does a `Car` have that it would use to start? - an `Engine`. So for a car to start it could call the `start` method on it's engine object.

```ruby
#car.rb

class Car
  attr_reader :make, :model
  attr_accessor :engine, :gearbox
  
  def initialise(make, model, engine, gearbox)
    @make = make
    @model = model
    @engine = engine
    @gearbox = gearbox
  end

  def start
    @engine.start()
  end
end
```

> Question: how would the car change gear?
> Answer:

```ruby
#car.rb

class Car
  # AS BEFORE 
  def change_gear(gear)  # ADDED
    @gearbox.change_gear(gear)
  end
end
```

So rather than inheriting from a superclass to get the functionality we need, we compose our object from other objects. We've been doing this already without actually calling it Composition

> think of an example from previous lessons - the band?

Using composition means that we can change the behaviour of a car, simply by swapping one component for another. For example, we can change the behaviour of the `Car`'s `start` method simply by swqpping a `Car`'s engine for a different engine with a different `start` method. We could do this using inheritance by overriding the method in the parent class, but that is static, and so cannot change. By using composition we can swap the engine in/out we can do this while our program is running, so is much more flexible.

So, anything that can be implemented using inheritance can also be implemented using composition. So what should we use - inheritance or composition?

### Inheritance OR Composition?

In programming there is the idea have the saying favour composition over inheritance. We should compose our classes from other classes that implement the behaviours we need. 

If we want objects of different classes to share the same behaviour then we can do this using composition. For example, if we want both a `Car` and a `Motorbike` to be able to start, then we can give them both an `Engine` which has it's own `start` method:

```ruby
#car.rb

class Car
  attr_reader :make, :model
  attr_accessor :engine, :gearbox
  
  def initialise(make, model, engine, gearbox)
    @make = make
    @model = model
    @engine = engine
    @gearbox = gearbox
  end

  def start
    @engine.start()
  end
end
```

```ruby
#motorbike.rb

class Motorbike
  attr_reader :make, :model
  attr_accessor :engine
  
  def initialise(make, model, engine)
    @make = make
    @model = model
    @engine = engine
  end

  def start
    @engine.start()
  end
end
```

```ruby
engine = Engine.new()
gearbox = Gearbox.new("manual", 5)

car = Car.new("Ford", "Escort", engine, gearbox)
motorbike = Motorbike.new("Yamaha", "FZR1000", engine)

car.start()
motorbike.start()
```

Inheritance can be useful and should not be disregarded totally. If the relationship between two classes is an __IS_A__ relationship, then use inheritance. If the relationship is a __HAS_A__ relationship, then use composition.

### Quiz 

What kind of relationship do you think each of these is?

- Computer & CPU.
<details>
<summary>Answer</summary>
__HAS_A__
</details>

- Circle & Shape.
<details>
<summary>Answer</summary>
__IS_A__
</details>

- Triangle & Sides
<details>
<summary>Answer</summary>
__HAS_A__
</details>

- Laptop & Computer.
<details>
<summary>Answer</summary>
__IS_A__
</details>

- Chair & Legs
<details>
<summary>Answer</summary>
__HAS_A__
</details>

## Recap

- Composition is where an object is made up of one or more other objects.
- Composition is usually favoured over inheritance.