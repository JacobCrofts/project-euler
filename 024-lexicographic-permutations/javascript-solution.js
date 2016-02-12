Array.prototype.nextPermutation = function() {
  var i = 0;
  var j = 0;
  var newArray = this;
  var that = this;

  // find the largest index i such that array[i - 1] < array[i]
  that.forEach(function(element, index) {
    if (that[index - 1] < that[index] && index > i) {
      i = index;
    }
  })

  // find the largest index j such that j >= i and array[j] > array[i - 1]
  that.forEach(function(element, index) {
    if (index >= i && that[index] > that[i - 1] && index > j) {
      j = index;
    }
  })

  // swap array[j] and array[i - 1]
  var firstElementToSwap = that[i - 1];
  var secondElementToSwap = that[j];

  newArray[i - 1] = secondElementToSwap;
  newArray[j] = firstElementToSwap;

  // reverse the suffix starting at array[i]
  var newSuffix = newArray.splice(i, Infinity).reverse();

  newArray = newArray.splice(0, i);

  newSuffix.forEach(function(element) {
    newArray.push(element);
  })

  return newArray;
}

Array.prototype.nthPermutation = function(n) {
  var currentPermutation = this;
  for (var permutationIndex = 1; permutationIndex < n; permutationIndex++) {
    currentPermutation = currentPermutation.nextPermutation();
  }
  return currentPermutation;
}

var digitsArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

console.log(digitsArray.nthPermutation(1000000).join(''));
