// for (const number of myNumbers) {
//   console.log(number);
// }

// myNumbers.forEach((number, index) => {
//   console.log(`This is number ${number} at index position ${index}`);
// });

const myNumbers = [1, 2, 3, 4, 5];

const multiplyByTwo = function (numbers) {
  const result = numbers.map((number) => {
    return number * 2;
  });

  return result;
}

// console.log(multiplyByTwo(myNumbers));



const moreNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

const getEvens = function (numbers) {
  const result = numbers.filter((number) => {
    return (number % 2 === 0);
  });

  return result;
}

// console.log(getEvens(moreNumbers));


const sumNumbers = function (numbers) {
  const total = numbers.reduce((runningTotal, number) => {
    return runningTotal + number;
  }, 0);

  return total;
}

// console.log(sumNumbers(moreNumbers));

const ourForEach = function (array, callback) {
  for (const element of array) {
    callback(element);
  }
};

ourForEach(myNumbers, (number) => {
  console.log(number);
});
