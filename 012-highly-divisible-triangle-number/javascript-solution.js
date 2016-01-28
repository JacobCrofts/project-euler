isPrime = function(number) {
  for (var counter = 2; counter <= Math.sqrt(number); counter++) {
    if (number % counter == 0) {
      return false;
    }
  }
  return true;
}

primeFactors = function(number) {
  if (isPrime(number)) {
    return number;
  }

  for (var counter = 2; counter <= number; counter++) {
    if (number % counter == 0 && isPrime(counter)) {
      return [counter, primeFactors(number / counter)]
    }
  }
}

// warning: returns NaN for non-integer input
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
  var facs = primeFactors(number).flatten();
  facs = facs.filter(function(element, index) {
    return (facs.slice(index, Infinity).count(element) == 1);
  })
  return facs;
}

console.log(numberOfdivisors(60));