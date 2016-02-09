// note: solution is not finished

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
var abundantSums = [];
var integersInRange = [];

for (var counter = 1; counter <= 28123; counter++) {
  if (isAbundant(counter)) {
    abundantNumbers.push(counter);
  }
  integersInRange.push(counter);
}

// correct through this point

// abundantNumbers.forEach(function(abundantNumber, index) {
//   for (var counter = 0; counter <= index; counter++) {
//     var sum = abundantNumber + abundantNumbers[counter];
//     abundantSums.push(sum);
//   }
// })

// console.log(abundantSums.length)

// var sumOfSums = nonAbundantSums.reduce(function(sum, element) {
//   return sum + element;
// })

// console.log(sumOfSums);
