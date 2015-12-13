# The sum of the squares of the first ten natural numbers is
# 12 + 22 + ... + 102 = 385

# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025

# Hence the difference between the sum of the squares of the
# first ten natural numbers and the square of the sum is
# 3025 − 385 = 2640.

# Find the difference between the sum of the squares of
# the first one hundred natural numbers and the square
# of the sum.

sum_of_squares = (1..100).inject {|sum, int| sum + int ** 2 }
square_of_sum = (1..100).reduce(:+) ** 2

solution = square_of_sum - sum_of_squares

p solution

# => 25164150


# This problem is excellent for practicing the .reduce and
# .inject methods, both of which I found very confusing when
# I first started learning Ruby. This solution can be refactored
# to a single line of code, but I left it untouched for readability.
