# Surprisingly there are only three numbers that can be written as the sum of fourth powers
# of their digits:

# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of fifth powers of their
# digits.

def nth_powers(n)
  (1..9).to_a.map {|num| num**n}
end

def possible_combos(digit_power)
  powers = nth_powers(digit_power)
  combos = []
  (2..9).each do |num_of_combos|
    combos << powers.repeated_combination(num_of_combos).to_a
  end
  combos.flatten(1)
end

def possible_sums(digit_power)
  possible_combos(digit_power).map { |combo| combo.reduce(:+)}.uniq
end

def sums_of_nth_powers(digit_power)
  possible_sums(digit_power).select do |possible_sum|
    possible_sum.to_s.split("").reduce(0) {|sum, digit| sum + digit.to_i ** digit_power} == possible_sum
  end
end

p sums_of_nth_powers(5).reduce(:+)

# => 443839
# The numbers are 4150, 4151, 93084, 92727, 54748, and 194979.

# The highest number for which the sum of the nth powers of its digits is greater than the number itself
# is as follows (I determined this through brute force):

# 2: 99
# 3: 1999
# 4: 19999
# 5: 229999
# 6: 2999999

# There must be a mathematical pattern here, but I have yet to determine what it is. Though I have
# arrived at what other users claim is a correct solution, I consider this problem unfinished until I
# discover the pattern.