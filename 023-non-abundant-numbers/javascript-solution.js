sumOfDivisors = function(number) {
  var sum = 0;
  for (var counter = 2; counter <= Math.sqrt(number); counter++) {
    if (number % counter == 0) {
      if (counter != Math.sqrt(number)) {
        sum += number / counter;
      }
      sum += counter;
    }
  }
  return sum + 1;
}

isAbundant = function(number) {
  return sumOfDivisors(number) > number;
}

var abundantNumbers = [];
var nonAbundantSums = [];

for (var counter = 1; counter <= 28123; counter++) {
  if (isAbundant(counter)) {
    abundantNumbers.push(counter);
  }
  nonAbundantSums.push(counter);
}

// console.log(abundantNumbers.length)
// console.log(nonAbundantSums.length)

abundantNumbers.forEach(function(abundantNumber) {
  abundantNumbers.forEach(function(otherAbundantNumber) {
    nonAbundantSums.splice(abundantNumber + otherAbundantNumber, 1)
  })
  // for (var counter = 0; counter < index; counter++) {
  //   nonAbundantSums.splice(abundantNumber + abundantNumbers[counter], 1)
  // }
})

var sumOfSums = nonAbundantSums.reduce(function(sum, element) {
  return sum + element;
})

console.log(sumOfSums);
