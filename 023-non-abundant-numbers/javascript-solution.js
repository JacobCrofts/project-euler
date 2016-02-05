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

for (var counter = 12; counter <= 28123; counter++) {
  if (isAbundant(counter)) {
    abundantNumbers.push(counter);
  }
}

var abundantSums = [];

abundantNumbers.forEach(function(abundantNumber) {
  abundantNumbers.forEach(function(otherAbundantNumber) {
    abundantSums.push(abundantNumber + otherAbundantNumber);
  })
})

