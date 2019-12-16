# Hogwarts Lab

## Part 1 - Single Model

Dumbledore has asked you to make a system for tracking student enrolments at Hogwarts. Your task is to build a sinatra web app, that persists data to a database.


Each student should have:

- A first name
- A second name
- A house (e.g. "Gryffindor", "Ravenclaw", "Hufflepuff" or "Slytherin")
- An age


### Step 1

- Create a database called `hogwarts`
- Create a `students` table

### Step 2

- Create a Student ruby model that can save() a student's details to the database
- Create some seed data to populate the database with students

### Step 3

Add methods to a student to:

- get all the students
- find a student by id

### Step 4

- Create an index view to diplay all the students on the page

### Step 5

- Create a `new` view with a form to enable a user to create a new student. The form should include a select with a dropdown of hard codeded house names - A house can be one of Gryffindor, Ravenclaw, Hufflepuff, or Slytherin.

## Part 2 - One-to-Many

You have been asked to store the houses in the separate table in the database. A house should have:

- A name
- Optionally, a url for a logo

### Step 6

- Create a `houses` table
- Create a ruby model that can save() the details of a house to the database
- Update your seeds file and reseed the database

### Step 7

- Add a method to `House` to get all houses
- Add a method to `House` to find a house by id

### Step 8

You now need to create the relationship between students and houses.

- Alter the student to have a foreign key to House instead of text
- Add a method to Student to find a house() for the student
- Update the view to display the informtation about the house, when displaying a student

## Extension

You have now been asked to populate the `<select>` on the students/new.erb view dynamically. You need to get all the houses from the database, and create an `<option>` element for each house.

