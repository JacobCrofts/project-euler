sumOfSquares = function(number) {
  var sum = 0;
  for (var counter = 1; counter <= number; counter++) {
    sum += counter * counter;
  }
  return sum;
}

squareOfSums = function(number) {
  var sum = 0;
  for (var counter = 1; counter <= number; counter++) {
    sum += counter;
  }
  return sum * sum;
}

console.log(squareOfSums(100) - sumOfSquares(100));
