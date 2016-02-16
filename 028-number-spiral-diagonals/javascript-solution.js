var sum = 1;
var currentNumber = 1;

for (var increment = 2; currentNumber < 1002001; increment += 2) {
  for (var counter = 0; counter < 4; counter++) {
    currentNumber += increment;
    sum += currentNumber;
  }
}

console.log(sum);
