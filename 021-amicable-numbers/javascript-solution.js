isAmicable = function(number) {
  if (number < 2) {
    return false;
  }
  return sumOfDivisors(sumOfDivisors(number)) == number && sumOfDivisors(number) != number;
}

sumOfDivisors = function(number) {
  var sum = 0;
  for (var counter = 1; counter <= number / 2; counter++) {
    if (number % counter == 0) {
      sum += counter;
    }
  }
  return sum;
}

var amicableNumbers = [];

for (var counter = 1; counter < 10000; counter++) {
  if (isAmicable(counter)) {
    amicableNumbers.push(counter);
  }
}

var sum = 0;

amicableNumbers.forEach(function(amicableNumber) {
  sum += amicableNumber;
})

console.log(sum);
