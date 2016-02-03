var triangle =
              [[75],
              [95, 64],
             [17, 47, 82],
            [18, 35, 87, 10],
           [20, 04, 82, 47, 65],
          [19, 01, 23, 75, 03, 34],
         [88, 02, 77, 73, 07, 63, 67],
        [99, 65, 04, 28, 06, 16, 70, 92],
       [41, 41, 26, 56, 83, 40, 80, 70, 33],
      [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
     [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
    [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
   [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
  [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
 [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]];

routesThroughTriangle = function(triangle, row, col, sum) {
  if (row == triangle.length - 1) {
    return sum + triangle[row][col];
  }

  sum += triangle[row][col];

  return [routesThroughTriangle(triangle, row + 1, col, sum), routesThroughTriangle(triangle, row + 1, col + 1, sum)];
}

Array.prototype.max = function() {

  array = this.join(',').split(',');

  var maxSum = 0;

  for (var counter = 0; counter < array.length; counter++) {
    if (parseInt(array[counter]) > maxSum) {
      maxSum = parseInt(array[counter]);
    }
  }

  return maxSum;
}

var routes = routesThroughTriangle(triangle, 0, 0, 0);

console.log(routes.max());
