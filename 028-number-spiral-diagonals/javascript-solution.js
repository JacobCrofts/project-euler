diagonalSum = function(sideLength) {
  var sum = 1;
  var currentNumber = 1;

  for (var increment = 2; currentNumber < sideLength * sideLength; increment += 2) {
    for (var counter = 0; counter < 4; counter++) {
      currentNumber += increment;
      sum += currentNumber;
    }
  }

  return sum;
}

console.log(diagonalSum(1001));
