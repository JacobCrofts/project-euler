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

  sum = sum.reverse();

  sum.forEach(function(digit, index) {
    var digits = digit.toString().split('');
    if (digits.length > 1) {
      sum[index] = digits[1];
      var existingDigit = sum[index + 1] || '0'
      sum[index + 1] = parseInt(existingDigit) + parseInt(digits[0]);
    }
  });

  return sum.reverse().join('');
}

var fibonaccis = ['1', '1'];

while (fibonaccis[fibonaccis.length - 1].length < 1000) {
  var last = fibonaccis.length - 1;
  fibonaccis.push(fibonaccis[last].addNumerically(fibonaccis[last - 1]));
}

console.log(fibonaccis.length);
