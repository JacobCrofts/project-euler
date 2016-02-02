twoToTheNth = function(n) {
  var solutionString = "2";
  for (var counter = 1; counter < n; counter++) {
    solutionString = addStrings(solutionString, solutionString);
  }
  return solutionString;
}

addStrings = function(string1, string2) {
  var carry = [];
  var topNumber = string1;
  var bottomNumber = string2;
  var solution = [];

  if (parseInt(string1) < parseInt(string2)) {
    topNumber = string2;
    bottomNumber = string1;
  }

  for (var counter = 1; counter <= topNumber.length; counter++) {
    var nextNumber = parseInt(topNumber[topNumber.length - counter]);

    if (parseInt(bottomNumber[bottomNumber.length - counter])) {
      nextNumber += parseInt(bottomNumber[bottomNumber.length - counter]);
    }

    if (carry[0]) {
      nextNumber += parseInt(carry[0]);
    }

    if (nextNumber > 9 && counter < topNumber.length) {
      carry[0] = nextNumber.toString()[0];
      solution.push(nextNumber.toString()[1]);
    } else {
      carry = [];
      solution.push(nextNumber.toString());
    }
  }

  return solution.reverse().join('');
}

var bigNumber = twoToTheNth(1000);
var sumOfDigits = 0;

for (var counter = 0; counter < bigNumber.length; counter++) {
  sumOfDigits += parseInt(bigNumber[counter]);
}

console.log(sumOfDigits);
