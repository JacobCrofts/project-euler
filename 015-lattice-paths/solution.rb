# Starting in the top left corner of a 2×2 grid, and only being able to move to the right
# and down, there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20×20 grid?

#   x   0    1    2    3   y
$a = [[".", "p", ".", "."],  # 0
     [".", ".", ".", "."],   # 7
     [".", ".", ".", "."],   # 11
     [".", ".", ".", "."]]   # 15

def possible_paths(side_length)
  indices = [0]

  until indices.uniq == [side_length ** 2 - 1]
    new_indices = []
    indices.each_with_index do |position, index|
      if position == side_length ** 2 - 1
        new_indices << position
      elsif (position + 1) % side_length != 0 && position < side_length ** 2 - side_length
        # neither on the right edge nor on the bottom edge
        new_indices << position + side_length
        new_indices << position + 1
      elsif (position + 1) % side_length == 0
        # on the right edge
        new_indices << position + side_length
      else
        # on the bottom edge
        new_indices << position + 1
      end
    end
    indices = new_indices
  end
  indices.length
end

p possible_paths(13)

# def possible_paths(side_length, index)
#   if (index + 1) % side_length != 0 && index < side_length ** 2 - side_length
#     # neither on the right edge nor on the bottom edge
#     possible_paths(side_length, index + 1) + possible_paths(side_length, index + side_length)
#   elsif index == side_length ** 2 - 1
#     # finished
#     return 1
#   elsif (index + 1) % side_length == 0
#     # on the right edge
#     possible_paths(side_length, index + side_length)
#   else
#     # on the bottom edge
#     possible_paths(side_length, index + 1)
#   end
# end

# p possible_paths(4, 0)

