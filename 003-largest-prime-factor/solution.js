isPrime = function(integer) {
  for (var counter = 2; counter < Math.floor(Math.sqrt(integer)); counter++) {
    if (integer % counter == 0) {
      return false;
    }
  }
  return true;
}

factors = function(integer) {
  var facs = [];
  for (var counter = 2; counter < Math.floor(Math.sqrt(integer)); counter++) {
    if (integer % counter == 0) {
      facs.push(counter);
    }
  }
  return facs;
}

facs = factors(600851475143).filter(function(factor) {
  return isPrime(factor);
})

console.log(facs[facs.length - 1])