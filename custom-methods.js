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
};

String.prototype.multiplyBy = function(otherString) {
  var timesToAdd = parseInt(this);
  var product = "0";
  for (var counter = 0; counter < timesToAdd; counter++) {
    product = product.addNumerically(otherString);
  }
  return product;
};

Number.prototype.primeFactors = function() {
  if (this.isPrime()) {
    return this;
  }
  var possibleFactor = 2
  while (this % possibleFactor != 0) {
    possibleFactor++;
  }
  return [possibleFactor, (this / possibleFactor).primeFactors()].join(',').split(',').map(function(element) {
    return parseInt(element);
  });
};

// too slow to be worth anything with large numbers:

// String.prototype.powerNumerically = function(otherString) {
//   var originalNumber = this;
//   var product = this;
//   for (var counter = 1; counter < parseInt(otherString); counter++) {
//     console.log(product);
//     product = product.multiplyBy(originalNumber);
//   }
//   return product;
// }
