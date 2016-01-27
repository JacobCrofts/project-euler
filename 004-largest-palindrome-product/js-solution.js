isPalindrome = function(integer) {
  intArray = integer.toString().split('')
  return intArray.join('') == intArray.reverse().join('')
}

var highestProduct = 0;

for (var number1 = 100; number1 < 1000; number1++) {
  for (var number2 = 100; number2 < 1000; number2++) {
    var product = number1 * number2;
    if (isPalindrome(product) && product > highestProduct) {
      highestProduct = product;
    }
  }
}

console.log(highestProduct)
