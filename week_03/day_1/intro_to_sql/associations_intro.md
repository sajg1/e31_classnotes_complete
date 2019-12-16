# Associations Intro

#### Objectives

- Explain the following types of associations:
	- One to one
	- One to many
	- Many to many

Up until now we have created a single characters table, and we could execute CRUD operations on them. This is pretty cool but we probably want more data to play with.

For example, our Jedi might want to own one or more lightsabers, and we might want to reflect their relationship in our tables.

Let's have a think. How should we structure our tables? We already had a single table of Characters:

> DRAW THE FOLLOWING

```
CHARACTERS
id,
name,
darkside,
age
```

If we were to have a table of lightsabers, it could look something like this:

```
LIGHTSABERS
id,
colour,
hilt_metal
```

But how can we explicitly state that there is a relationship between the 2 tables?

The most straightforward way to do this is to add another column to our lightsabers table, and referring to the name of the owner.

```
LIGHTSABERS
id,
colour,
hilt_metal,
owner_name
```

This way, we can try to search for lightsabers with a certain owner name like such:

```sql
SELECT * FROM lightsabers WHERE owner_name = 'Obi-Wan Kenobi';
```

However, there are problems. What happens if I make a typo in either the Characters name column, or the Lightsabers owner_name column? No chance of me ever finding it. Not to mention that 2 Characters might have matching names, or one Character might get married, change name, therefore losing reference to their lightsabers!


What could be used that is explicit, unique, and will not be modified by the user? The ID field!

Currently it can be modified by the user and we do not tell SQL to make sure that the IDs are unique. We can change that by setting our ID field to be something SQL calls a PRIMARY KEY. More about that a bit later - for now, let's just say that the main identifier of our tables will be also called a primary key.

```
LIGHTSABERS
id,
colour,
hilt_metal,
character_id // UPDATED, connect it with characters ID field
```

And to make it even more foolproof, we can tell SQL that all referenced character_id MUST exist in the characters table.

This is also called a foreign key, because a foreign tables primary key is being referenced in this column.

In SQL, when we start to have multiple tables, we relate a data ( this is why we call SQL a relational database ) row to one or more data rows in another table. There are a few different relationships that we can establish:

- One to one
- One to many
- Many to many

## One to one

In a one-to-one relationship, a given row in one database table is linked to one and only one other row in another table.

#### musicians table
| columns | id | first\_name | last\_name | stage_pass\_id |
|---|---|---|---|---|
| 1st row: |Primary key| Lemmy | Kilmister | ID of stage pass for Lemmy - foreign key|

#### stage passes table
| columns | id | number | musician\_id |
|---|---|---|---|
|1st row: |Primary key| SD123987 | ID of Lemmy from musicians table - foreign key|


## One to many

Now we can start working with relationships where a single item is related to multiple items - Think about multiple passengers in a bus, a lot of fish in the river. How would we model a relationship where one musician owns a lot of instruments?

We might have a musicians table.

#### musicians table
| columns | id | first\_name | last\_name |
|---|---|---|---|
| 1st row: |Primary key| Dave | Grohl |

We may also have a bands table.

#### instruments table
| columns | id | type | name |
|---|---|---|---|
| 1st row: |Primary key| drums | Tama |

Now we can setup a one to many association. We can say one musician row is associated to many instrument rows.  With this setup, we use the musician_id as the FOREIGN KEY. We use this foreign key to reference the ID of the associated row in the other table.

So, we would add this column to our instruments:

#### instruments table
| columns | id | type | name | musician_id |
|---|---|---|---|---|
| 1st row: |Primary key| drums | Tama | id of Dave Grohl from musicians_table |
| 2nd row: |Primary key| guitar | Gibson | id of Dave Grohl from musicians_table |

## Many to Many

Now we get to the point where we want to display a relationship between bands and musicians.

A musician can play in multiple bands, and a band usually have more than one member. How can we show this in our DB setup?

Putting a foreign key in each table would make it a one-to-one relationship. Putting a foreign key in one of them would make it a one-to-many relationship.

Our solution is adding a third table, a join or junction table! Each entry in this join table should include the band's id and the musician's id, thus representing the relationship between one musician and one band - but we can have many of this kind of entries, each representing a relationship!

The table can be named bands_musicians, because they will contain both of their ID's, unless we can give them a better name that represents the relationship better.

#### musicians_bands table
| columns | id | band\_id | musician\_id |
|---|---|---|---|
| 1st row: |Primary key| ID of Nirvana | ID of Dave Grohl |
| 2nd row: |Primary key| ID of Nirvana | ID of Krist Novoselic |
| 3rd row: |Primary key| ID of Foo Fighters | ID of Dave Grohl |
| 4th row: |Primary key| ID of Foo Fighters | ID of Chris Shiflett |

Therefore each and every entry in this table would map to a member of a band. We can add more members of Foo Fighters with more rows in our musicians_bands, but we can also put Dave Grohl in other bands!
Of course we can have multiple rows in it, representing multiple members, creating a nice model of a many-to-many relationship!

## PAIRED TASK:

Model the following associations, including the datatypes

- CUSTOMERS & CUSTOMER_DETAILS
- BASKETBALL TEAMS & PLAYERS
- QUIDDITCH PLAYERS & BROOMSTICKS
- ORDERED ITEMS & CUSTOMERS

> Note: Quidditch players & Broomsticks can be both a one to one, or a one to many!
