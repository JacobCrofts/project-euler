var sum = 0;

for (var counter = 1; counter < 1000; counter++) {
  if (counter % 3 == 0 || counter % 5 == 0) {
    sum += counter;
  }
}

console.log(sum);
