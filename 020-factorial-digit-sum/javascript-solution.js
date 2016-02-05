addStrings = function(string1, string2) {
  var higherNumber = string1;
  var lowerNumber = string2;
  var carry = false;
  var sum = [];

  if (parseInt(string1) < parseInt(string2)) {
    higherNumber = string2;
    lowerNumber = string1;
  }

  for (var counter = 1; counter <= higherNumber.length; counter++) {

    var next = parseInt(higherNumber[higherNumber.length - counter]);

    if (parseInt(lowerNumber[lowerNumber.length - counter])) {
      next += parseInt(lowerNumber[lowerNumber.length - counter]);
    }

    if (carry) {
      next += parseInt(carry);
    }

    next = next.toString();

    if (next.length > 1 && counter != higherNumber.length) {
      carry = next[0];
      next = next[1];
    } else {
      carry = false;
    }

    sum.push(next);

  }

  return sum.reverse().join('');
}

multiplyStrings = function(string1, string2) {
  var timesToAdd = parseInt(string1);
  var product = "0";
  for (var counter = 0; counter < timesToAdd; counter++) {
    product = addStrings(product, string2);
  }
  return product;
}

factorial = function(number) {
  if (number == 1) {
    return "1";
  }
  return multiplyStrings(number.toString(), factorial(number - 1));
}

var bigNumber = factorial(100).split('');
var sum = 0;

bigNumber.forEach(function(digit) {
  sum += parseInt(digit);
})

console.log(sum);
