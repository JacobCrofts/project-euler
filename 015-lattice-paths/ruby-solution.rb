# Starting in the top left corner of a 2×2 grid, and only being able to move to the right
# and down, there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20×20 grid?

start_time = Time.now

def possible_paths(side_length)
  values = (0..(side_length + 1) ** 2 - 1).to_a.map{0}
  until values.count(0) == 1
    new_values = []
    values.each_with_index do |value, index|
      if index == 0
        new_values[index] = 0
      elsif index % (side_length + 1) == 0
        new_values[index] = 1
      elsif index <= (side_length)
        new_values[index] = 1
      else
        new_values[index] = values[index - 1] + values[index - (side_length + 1)]
      end
      values = new_values
    end
  end
  values.last
end

p possible_paths(20)
p "calculated in #{(Time.now - start_time) * 1000} ms"

# => 137846528820


# This one took me nearly four full train rides to think through. I came up with a recursive
# method that solved the problem by manually counting all of the possible paths, then an
# iterative one, but both took too long to run for grids larger than 14x14. I made a
# breakthrough when I realized that on the right and bottom edges, only one possible path
# existed. At the index diagonally up and left of the final index, the number of paths at
# that point is the sum of the index to the bottom and the index to the right. The same is
# true of all indices! I flipped my board diagonally such that paths traveled from the bottom
# right to the top left, and now my method will find the number of paths for any nxn grid, not
# just a 20x20.
