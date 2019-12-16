# SQL Practice Lab - Libraries

## Objectives

- Practice creating tables in an SQL database
- Practice using CRUD commands in an SQL database

## MVP

### Set up the database

Using `psql` create a database called `libraries`

Write your commands in a file called `libraries.sql`
You can then run the commands in this file with

```
psql -d libraries -f libraries.sql
```

### Creating Tables

Create a table `libraries` where each row has the following column:

- id
- name

Create a table `books` where each row has the following column:

- id
- title
- author
- library_id - this column should relate to the id of a library in the `libraries` table.
- rented - this should be true or false.

### Create

Create entries in the `libraries` table with the following information:

- Name: McDonald Road
- Name: Morningside

Now add entries to the `books` table for the following books:

|Title                  |Author          |Library      |Rented|
|-----------------------|----------------|-------------|------|
|2001: A Space Odyssey  |Arthur C. Clarke|McDonald Road|false |
|A Brief History of Time|Stephen Hawking |McDonald Road|false |
|A Tale of Two Cities   |Charles Dickens |Morningside  |false |
|The Odyssey            |Homer           |Morningside  |false |

**_HINT_** you will need to use the ids of the libraries

### Read

- List all the entries in the libraries table
- List all the entries in the books table
- List all the books for the McDonald Road library

### Update

- Set the `rented` status of `2001: A Space Odyssey` to `true`
- Set the `rented` status of `A Tale of Two Cities` to `true`
- List all the books for which `rented` is `false`

### Delete

- Remove `A Tale of Two Cities` from the `books` table.

## Extensions

- Create an `authors` table and modify the `books` table so that the author of a book refers to an entry in the `authors` table.

- Add a new table `genres` and modify the `books`table so that each book has a `genre` which refers to an entry in the `genres` table.

(**_HINT_** rather than deleting and re-creating the table from scratch, research how to add a column to an existing table.)
