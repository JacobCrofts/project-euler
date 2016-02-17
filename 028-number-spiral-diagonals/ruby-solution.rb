def diagonal_sum(spiral_grid_length)
  increment = 2
  numbers_to_sum = [1]

  until numbers_to_sum.last == spiral_grid_length**2
    4.times { numbers_to_sum << numbers_to_sum.last + increment}
    increment += 2
  end

  numbers_to_sum.reduce(:+)
end

p diagonal_sum(1001)

# => 669171001

# I tried to solve this visually at first. That is, I wrote a method that finds the diagonal
# sum of any square grid. I was about to place the numbers (1..1001**2) into an empty grid when
# I realized that there is a very simple mathematical pattern to this problem. After 1, the
# number of spaces we must move (in a spiraling movement pattern) before we reach the next
# countable number goes like this: 2, 2, 2, 2, 4, 4, 4, 4, 6, 6, 6, 6... Once I realized this,
# it was very easy for me to write a method that finds the diagonal sum of any spiraling grid.
