const assert = require('assert');
const Taxi = require('../taxi.js');

describe('Taxi', function () {
  let taxi;

  beforeEach(function () {
    taxi = new Taxi('Skoda', 'Octavia', 'Dave');
  });

  it('should have a manufacturer', function () {
    const actual = taxi.manufacturer;
    assert.strictEqual(actual, 'Skoda');
  });

  it('should have a model', function () {
    const actual = taxi.model;
    assert.strictEqual(actual, 'Octavia');
  });

  it('should have a driver', function () {
    const actual = taxi.driver;
    assert.strictEqual(actual, 'Dave');
  });

  describe('passengers', function () {
    it('should start with no passengers', function () {
      const actual = taxi.passengers;
      assert.deepStrictEqual(actual, []);
    });

    it('should be able to return the number of passengers', function () {
      const actual = taxi.numberOfPassengers();
      assert.strictEqual(actual, 0);
    });

    it('should be able to add passengers', function () {
      taxi.addPassenger('Steve');
      const actual = taxi.numberOfPassengers();
      assert.strictEqual(actual, 1);
    });

    it('should be able to remove a passenger by name', function () {
      taxi.addPassenger('Louise');
      taxi.addPassenger('Colin');
      taxi.removePassengerByName('Louise');
      const expected = ['Colin'];
      const actual = taxi.passengers;
      assert.deepStrictEqual(actual, expected);
    });

    it('should be able to clear the taxi', function () {
      taxi.addPassenger('Louise');
      taxi.addPassenger('Colin');
      taxi.removeAllPassengers();
      const actual = taxi.numberOfPassengers();
      assert.strictEqual(actual, 0);
    });
  });
});
