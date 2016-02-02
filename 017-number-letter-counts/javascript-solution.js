numberToWords = function(number) {
  var ones = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
  var awkwardTeens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"];
  var tens = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"];

  if (number == 1000) {
    return "onethousand";
  }

  if (number > 99) {
    var hundredsPlace = Math.floor(number / 100);
    if (hundredsPlace == number / 100) {
      return ones[hundredsPlace] + "hundred";
    } else {
      return ones[hundredsPlace] + "hundredand" + numberToWords(number % 100);
    }
  }

  if (number > 19) {
    var tensPlace = Math.floor(number / 10);
    if (tensPlace == number / 10) {
      return tens[tensPlace];
    } else {
      return tens[tensPlace] + numberToWords(number % 10);
    }
  }

  if (number > 9) {
    return awkwardTeens[number - 10];
  }

  return ones[number];
}

var sumOfletters = 0;

for (var counter = 1; counter <= 1000; counter++) {
  sumOfletters += numberToWords(counter).length;
}

console.log(sumOfletters);
