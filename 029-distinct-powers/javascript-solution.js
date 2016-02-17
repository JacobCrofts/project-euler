require("../custom-methods")

var powers = [];

for (var a = 2; a <= 100; a++) {
  for (var b = 2; b <= 100; b++) {
    var powerFactors = [];
    for (var counter = 1; counter <= b; counter++) {
      powerFactors.push(a.primeFactors())
    }
    powers.push(powerFactors.join(',').split(',').sort());
  }
}

var distinctPowers = [];
var usedPowers = {};

powers.forEach(function(power) {
  if (!usedPowers[power]) {
    distinctPowers.push(power);
  }
  usedPowers[power] = true;
})

console.log(distinctPowers.length);
