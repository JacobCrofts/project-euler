var fibonacciSequence = [1, 2]

var counter = 0;
var evenFibonacciCount = 2;

while (fibonacciSequence[fibonacciSequence.length - 1] < 4000000) {
  var nextTerm = fibonacciSequence[fibonacciSequence.length - 2] + fibonacciSequence[fibonacciSequence.length - 1];
  fibonacciSequence.push(nextTerm);
  if (nextTerm % 2 == 0) {
    evenFibonacciCount += nextTerm;
  }
}

console.log(evenFibonacciCount);