String.prototype.addNumerically = function(otherString) {
  var topNumber = this;
  var bottomNumber = otherString;
  var sum = [];

  if (parseInt(bottomNumber) > parseInt(topNumber)) {
    topNumber = otherString;
    bottomNumber = this;
  }

  while (bottomNumber.length < topNumber.length) {
    bottomNumber = '0' + bottomNumber;
  }

  topNumber.split('').forEach(function(topDigit, index) {
    var bottomDigit = parseInt(bottomNumber[index]) || 0;
    sum.push(parseInt(topDigit) + bottomDigit);
  })

  // console.log(sum)

  sum = sum.reverse();

  sum.forEach(function(digit, index) {
    var digits = digit.toString().split('');
    if (digits.length > 1) {
      sum[index] = digits[1];
      // console.log(sum[index + 1])
      var existingDigit = sum[index + 1] || '0'
      sum[index + 1] = parseInt(existingDigit) + parseInt(digits[0]);
    }
  });

  // console.log(sum)
  return sum.reverse().join('');
}

// console.log('8'.addNumerically('5'))

var lastTwoFibonaccis = ['1', '1'];

for (var fibIndex = 1; fibIndex < 20; fibIndex++) {
  var nextFib = lastTwoFibonaccis[0].addNumerically(lastTwoFibonaccis[1])
  lastTwoFibonaccis[0] = lastTwoFibonaccis[1];
  lastTwoFibonaccis[1] = nextFib.toString();
  console.log(nextFib)
}

// console.log(lastTwoFibonaccis[1]);
// console.log(fibIndex);