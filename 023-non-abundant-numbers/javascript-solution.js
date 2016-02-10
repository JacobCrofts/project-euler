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
var numbersAreSumsOfAbNums = {};

for (var counter = 1; counter <= 28123; counter++) {
  if (isAbundant(counter)) {
    abundantNumbers.push(counter);
  }
  numbersAreSumsOfAbNums[counter] = false;
}


abundantNumbers.forEach(function(abundantNumber, index) {
  for (var counter = 0; counter <= index; counter++) {
    var sum = abundantNumber + abundantNumbers[counter];
    if (numbersAreSumsOfAbNums[sum] == false) {
      numbersAreSumsOfAbNums[sum] = true;
    }
  }
})

var sumOfNonAbundantSums = 0;

for (var counter = 1; counter <= 28123; counter++) {
  if (numbersAreSumsOfAbNums[counter] == false) {
    sumOfNonAbundantSums += counter;
  }
}

console.log(sumOfNonAbundantSums);
