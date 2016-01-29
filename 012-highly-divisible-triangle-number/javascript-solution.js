isPrime = function(number) {
  for (var counter = 2; counter <= Math.sqrt(number); counter++) {
    if (number % counter == 0) {
      return false;
    }
  }
  return true;
}

primeFactors = function(number) {
  if (number < 2) {
    return [];
  }

  if (isPrime(number)) {
    return [number];
  }

  for (var counter = 2; counter <= number; counter++) {
    if (number % counter == 0 && isPrime(counter)) {
      return [counter, primeFactors(number / counter)]
    }
  }
}

Array.prototype.flatten = function() {
  return this.join(',').split(',').map(function(element) {
    return parseInt(element);
  });
}

Array.prototype.count = function(number) {
  repetitions = 0;
  this.forEach(function(element) {
    if (element == number) {
      repetitions++
    }
  });
  return repetitions;
}

numberOfdivisors = function(number) {
  var factors = primeFactors(number).flatten();
  uniqueFactors = factors.filter(function(element, index) {
    return (factors.slice(index, Infinity).count(element) == 1);
  })
  product = 1;
  uniqueFactors.forEach(function(element) {
    product *= (factors.count(element) + 1)
  })
  return product;
}

var triangleNumber = 1;
var nextIncrement = 2;

while (numberOfdivisors(triangleNumber) < 500) {
  triangleNumber += nextIncrement;
  nextIncrement++;
}

console.log(triangleNumber);