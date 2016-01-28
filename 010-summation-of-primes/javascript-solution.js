isPrime = function(number) {
  for (var counter = 2; counter <= Math.sqrt(number); counter++) {
    if (number % counter == 0) {
      return false;
    }
  }
  return true;
}

var sum = 0;

for (var counter = 2; counter < 2000000; counter++) {
  if (isPrime(counter)) {
    sum += counter;
  }
}

console.log(sum);
