# Customising the JpaRepository

**Lesson Duration: 30 minutes**

### Learning Objectives
- Understand how to setup specialised implementations of the JpaRepository in order to create custom queries

# Introduction
**Why are we learning this?** With Spring, the provided `JpaRepository` that we've already used is fantastic for CRUD, however when it comes to building custom queries we need to build them *using* the `JpaRepository` as a base. 

**What problem are we trying to solve?**  Setting up our application to be able to build custom queries.

**By the end of this lesson you will be able to**
Setup our own custom repository classes in preperation for building customised queries.


## JpaRepository

Currently, when doing CRUD for a particular model, we create an `interface` which *inherits* from the Spring provided `JpaRepository`. This means we can dependency inject that interface, and use it to do all the things that `JpaRepository` allows.

In our case, if we want to do queries using `Ship`, we create a `ShipRepository` class which inherits from `JpaRepository`.

![](../images/Spring_ShipRepository_JpaRepository.png)


## Customising JpaRepository

We wish to use the same `interface` that inherits from `JpaRepository` for our own custom queries, but it's not possible to directly write method implementations in an `interface`. A solution to this would normally be to make a class that uses the interface, but if we do that, then Java expects that class to implement all of the methods in the interface, which **is exactly the contract that using an interface is for in Java**. However, we don't want to re-implement all of the abstract methods in `JpaRepository`.

To solve this, lets create another interface, called the "Custom" version. This interface will have methods which we will provide implementations for in an "Implementation" or "Impl" class.

The `ShipRepositoryCustom.java` is an interface. We will use it to add method prototypes for custom queries. For now, it's empty.

```java
public interface ShipRepositoryCustom {
   // TODO: Put method prototypes for custom queries in here.
}

```

The Implementation  - `ShipRepositoryImpl.java` class will provide concrete methods for each method in the custom interface.

```java
public class ShipRepositoryImpl implements ShipRepositoryCustom {
   //TODO: Put full methods for custom queries here
}
```


To make use of these, we need to ask `ShipRepository` to inherit from the `ShipRepositoryCustom` interface **as well as** `JpaRepository`.

```java
@Repository
public interface ShipRepository extends JpaRepository<Ship, Long>, ShipRepositoryCustom {
   // TODO: Put method prototypes for custom queries in here.
}

```

As the TODO's suggest, when we implement custom queries they will go into `ShipRepositoryImpl`, the method prototypes will go into `ShipRepositoryCustom` and the original `ShipRepository`.

We now have a structure like:
![](../images/ShipRepositoryCustom_UML.png)

# Summary
- Learned how to setup specialised implementations of the JpaRepository in order to create custom queries

# Next Lesson
* **Criteria Queries** - implement custom queries