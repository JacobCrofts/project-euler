# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5
# spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# The sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the
# same way?

def print_nicely(some_2d_array)
  some_2d_array.each {|row| print row; puts ""}
end

a = [[21, 22, 23, 24, 25],
    [20, 7, 8, 9, 10],
    [19, 6, 1, 2, 11],
    [18, 5, 4, 3, 12],
    [17, 16, 15, 14, 13]]

a_reversed = a.map {|x| x.reverse}

def diagonal_sum(some_2d_array)
  a = some_2d_array
  a_rev = a.map {|x| x.reverse}
  upper_left_coords = [0, 0]
  upper_right_coords = [0, some_2d_array.length]
  while some_2d_array[coords[0]][coords[1]] <= some_2d_array.first.length

  end

end

spiral_array = []

1001.times {spiral_array << []}
spiral_array.each {|empty_array| 1001.times {empty_array << []}}

print_nicely(a_reversed)
print_nicely(a)