start_time = Time.now

triangle =
"              75
              95 64
             17 47 82
            18 35 87 10
           20 04 82 47 65
          19 01 23 75 03 34
         88 02 77 73 07 63 67
        99 65 04 28 06 16 70 92
       41 41 26 56 83 40 80 70 33
      41 48 72 33 47 32 37 16 94 29
     53 71 44 65 25 43 91 52 97 51 14
    70 11 33 28 77 73 17 78 39 68 17 57
   91 71 52 38 17 14 91 43 58 50 27 29 48
  63 66 04 68 89 53 67 30 73 16 69 87 40 31
 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

maze = triangle.split("\n").map {|str| str.split(" ")}
maze.each {|row| row.map! {|char| char.to_i}}

def highest_sum(maze, row = 0, column = 0, sum = 0)
  sum += maze[row][column]
  return sum if row == maze.length - 1
  sum + [highest_sum(maze, row + 1, column), highest_sum(maze, row + 1, column + 1)].max
end

p highest_sum(maze)
p "calculated in #{(Time.now - start_time) * 1000} ms"
