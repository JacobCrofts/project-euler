repeatingDecimalSequenceLength = function(divisor) {
  var statuses = {};
  var decimalSequence = '';
  var currentDividend = 10;
  var startIndex;

  for (var sequenceIndex = 0; statuses[currentDividend] == undefined; sequenceIndex++) {
    statuses[currentDividend] = sequenceIndex;
    decimalSequence += (Math.floor(currentDividend / divisor)).toString();
    currentDividend = (currentDividend % divisor) * 10;
    startIndex = statuses[currentDividend];
  }

  var finalSequence = decimalSequence.split('').splice(startIndex, Infinity).join('');

  if (finalSequence == '0') {
    return 0;
  } else {
    return finalSequence.length;
  }
}

var highestSequenceLength = [0, 0]

for (var divisor = 2; divisor < 1000; divisor++) {
  var nextSequencelength = repeatingDecimalSequenceLength(divisor);
  if (nextSequencelength > highestSequenceLength[1]) {
    highestSequenceLength[0] = divisor;
    highestSequenceLength[1] = nextSequencelength;
  }
}

console.log(highestSequenceLength[0]);
