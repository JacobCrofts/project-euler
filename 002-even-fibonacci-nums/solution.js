var fibonacciSequence = [1, 2]

for (var counter = 1; fibonacciSequence[-1] < 20; counter++) {
  console.log(fibonacciSequence[counter])
  fibonacciSequence.push(fibonacciSequence[counter] + fibonacciSequence[counter - 1]);
}

// console.log(fibonacciSequence)