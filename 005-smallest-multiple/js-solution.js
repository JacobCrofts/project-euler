divByAllUpToTwenty = function(integer) {
  for (var counter = 11; counter <= 20; counter++) {
    if (integer % counter != 0) {
      return false;
    }
  }
  return true;
}

var counter = 2520;

while (!divByAllUpToTwenty(counter)) {
  counter += 2520;
}

console.log(counter);
