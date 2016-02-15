Number.prototype.isPrime = function() {
  if (this < 2) {
    return false;
  }
  for (var counter = 2; counter <= Math.sqrt(this); counter++) {
    if (this % counter == 0) {
      return false;
    }
  }
  return true;
};

quadraticFunction = function(a, b, n) {
  return n * n + a * n + b;
};

numberOfConsecutivePrimes = function(a, b) {
  var total = 0;
  for (var counter = 0; quadraticFunction(a, b, counter).isPrime(); counter++) {
    total++
  }
  return total;
};

var secondNumberOptions = [];

for (var counter = 2; counter < 1000; counter++) {
  if (counter.isPrime()) {
    secondNumberOptions.push(counter);
  }
}

var combos = [];

secondNumberOptions.forEach(function(b) {
  for (var a = 999; a + b >= 1; a--) {
    combos.push([a, b]);
  }
});

highestCombo = [0, 0];
highestSequenceLength = 0;

combos.forEach(function(combo) {
  var thisSequenceLength = numberOfConsecutivePrimes(combo[0], combo[1])
  if (thisSequenceLength > highestSequenceLength) {
    highestCombo = combo;
    highestSequenceLength = thisSequenceLength;
  }
});

console.log(highestCombo[0] * highestCombo[1]);
