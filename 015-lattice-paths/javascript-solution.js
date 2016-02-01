numberOfPaths = function(gridLength) {
  var grid = [];

  for (var rowIndex = 0; rowIndex <= gridLength; rowIndex++) {
    var row = [];
    for (var cellIndex = 0; cellIndex <= gridLength; cellIndex++) {
      row.push(0);
    }
    grid.push(row);
  }

  grid = grid.map(function(row, rowIndex) {
    return row.map(function(cell, cellIndex) {
      // TIL JavaScript has a XOR operator
      if (rowIndex == 0 ^ cellIndex == 0) {
        return 1;
      }
      return 0;
    })
  })

  while (grid.isNotFilledIn()) {
    grid = grid.map(function(row, rowIndex) {
      return row.map(function(cell, cellIndex) {
        if (cell == 0 && !rowIndex == 0) {
          if (grid[rowIndex][cellIndex - 1] > 0 && grid[rowIndex - 1][cellIndex] > 0) {
            return grid[rowIndex][cellIndex - 1] + grid[rowIndex - 1][cellIndex];
          }
        }
        return cell;
      })
    })
  }

  return grid[gridLength][gridLength];
}

Array.prototype.isNotFilledIn = function() {
  var filledIn = false;
  this.forEach(function(row, rowIndex) {
    row.forEach(function(cell, cellIndex) {
      if (cell == 0 && cellIndex != 0) {
        filledIn = true;
      }
    })
  })
  return filledIn;
}

console.log(numberOfPaths(20))