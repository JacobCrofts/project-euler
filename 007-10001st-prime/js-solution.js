isPrime = function(number) {
  for (var counter = 2; counter <= Math.floor(Math.sqrt(number)); counter++) {
    if (number % counter == 0) {
      return false;
    }
  }
  return true;
}

var primes = [];

for (var possiblePrime = 2; primes.length < 10001; possiblePrime++) {
  if (isPrime(possiblePrime)) {
    primes.push(possiblePrime);
  }
}

console.log(primes[primes.length - 1]);
