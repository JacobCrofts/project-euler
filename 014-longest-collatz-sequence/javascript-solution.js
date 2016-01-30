var collatzSequenceLengths = {}

for (var counter = 1; counter < 1000000; counter++) {
  var term = counter;
  var sequenceLength = 1;

  while (term != 1) {
    if (collatzSequenceLengths[term] != undefined) {
      sequenceLength += collatzSequenceLengths[term] - 1;
      term = 1;
    } else {
      if (term % 2 == 0) {
        term = term / 2;
      } else {
        term = 3 * term + 1;
      }
      sequenceLength++
    }
  }

  collatzSequenceLengths[counter] = sequenceLength;
}

var maxValue = 0;
var maxKey = 0;

for (var counter = 1; counter < 1000000; counter++) {
  if (parseInt(collatzSequenceLengths[counter]) > maxValue) {
    maxValue = collatzSequenceLengths[counter];
    maxKey = counter;
  }
}

console.log(maxKey);