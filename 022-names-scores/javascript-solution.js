require("./p022_names")

var sortedNames = names.sort();

wordValue = function(word) {
  var sum = 0;
  word.split('').forEach(function(letter, index) {
    sum += letter.charCodeAt(0) - 64;
  });
  return sum * (names.indexOf(word) + 1);
}

var nameSum = 0;

for (var counter = 0; counter < names.length; counter++) {
  nameSum += wordValue(names[counter]);
}

console.log(nameSum);
