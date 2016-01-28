isSpecialPythagoreanTriplet = function(a, b, c) {
  return ((a * a + b * b == c * c) && (a + b + c == 1000))
}

for (var a = 1; a <= 1000; a++) {
  for (var b = 1; b <= 1000; b++) {
    for (var c = 1; c <= 1000; c++) {
      if (isSpecialPythagoreanTriplet(a, b, c)) {
        var specialTriplet = a * b * c;
      }
    }
  }
}

console.log(specialTriplet);
