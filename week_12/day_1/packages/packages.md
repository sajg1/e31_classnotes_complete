# Packages and Access Modifiers

## Learning Objectives

- Understand that you can organise your code in packages

## Introduction to packages.

Packages are essentially groups of classes in a folder. The purpose is to organise your classes in a structured way. You guys have already seen them when you created a new project. You had 2 packages, one to store your code, and one to store your unit tests.

Now we are going to work off a simple project that has a few packages.

```
    Use packages start point
```

[!] Draw a box similar to one from this site https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html

Okay, we can see we have two packages, one for animals and one for humans. These packages will contain the respective code. A dog is inside the animal package and has a public string name and bark, and human class inside the human package and has a teach method that accepts a dog class.

`Note that the convention for naming packages is lowerCamelCase`

So if we we were look at the folder structure of our codebase. It would look like this (each package name is its own folder):

```

    / - codeclan
        / - com
            / - packagesexample
                / - animal
                    / - Dog.java
                / - human
                    / - Trainer.java
```

So in Ruby, when we wanted Trainer to see Dog, we would write a require_relative(./../animal/dog). In java we need to be more explicit. So we say

```
import codeclan.com.packagesexample.animal.Dog;
```

We could say

```
import codeclan.com.packagesexample.animal.*;
```

Which will import all classes from that animal package. This, however, is considered bad practice if we only needed one. So change the import back to Dog.

We can create sub-packages in packages (they will just become subfolders).

Create a package called air inside animal.

In the air package create Bird class.

In the bird class create a method called `speak()` that returns "Tweet Tweet".


Now in trainer create a `trainBird` method that takes in a bird and returns the result of calling the birds speak method.

(Note that there are commented tests for this in the test suite. )


Inside Trainer, we can import the Bird like so

```
   import codeclan.com.packagesexample.animal.air.Bird;
```

Note we cannot say

```
    import codeclan.com.packagesexample.animal.*;     
```

To import the bird, this is because * is not recursive, only pulls it in from that folder and not subfolders.

## Protected keyword

So far we have only really dealt with `private` and `public` access modifiers.

There is a third on in Java known as `protected`.

Unlike private, which can only be accessed within the class itself, `protected` can only be accessed from any class within the package.

Change the dogs `bark()` method to `protected`.

Note now that in Trainer there is an error telling us that `bark()` is `protected`.

We would only be able to invoke `bark()` from trainer if they were in the same package.

(Change `bark()` back to public)


## Summary

Packages are a good way to structure our files and group common classes or behaviours together.

The protected keyword gives us an additional level of security for our variables and methods should we only wish them to be accessed from within the same package.
