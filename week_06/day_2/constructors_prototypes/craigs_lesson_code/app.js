const Pet = require('./pet.js');
const Person = require('./person.js');

const scooby = new Pet('Scooby Doo', 'dog');
// scooby.eat('cake');

const shaggy = new Person('Shaggy Rogers', scooby);
// shaggy.greet();



shaggy.feedPet('spaghetti');
