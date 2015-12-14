# The sequence of triangle numbers is generated by adding the natural numbers.
# So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first
# ten terms would be:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28

# We can see that 28 is the first triangle number to have over five divisors.

# What is the value of the first triangle number to have over five hundred divisors?

require 'prime'

def prime_factors(integer)
  return [integer] if integer.prime?
  factors = []
  counter = 2
  until integer % counter == 0
    counter += 1
  end
  factors << [counter, prime_factors(integer / counter)]
  factors.flatten
end

def number_of_divisors(integer)
  counts = {}
  prime_factors(integer).each do |factor|
    counts[factor] ||= 0
    counts[factor] += 1
  end
  counts.each_value.inject(1) {|prod, value| prod * (value + 1)}
end

def nth_triangle_number(n)
  return 1 if n == 1
  (1..n).reduce(:+)
end

n = 2
until number_of_divisors(nth_triangle_number(n)) > 500
  n += 1
end

solution = nth_triangle_number(n)

p solution

# => 76576500


# This takes about 5 seconds to run, so I will try to refactor it later
# for performance. My original approach was to iterate through (1..integer)
# and simply count the number of divisors in that range using modulo. It
# works fine with small numbers, but with larger ones it takes too long to run.

# The trick here, and I think this puzzle is unsolvable without it, is that
# if a number's prime factors are listed like this: a^r * b^s * ..., then the
# number of divisors for the number is (r + 1) * (s + 1) * ... . For example,
# the prime factors of 60 are 2, 2, 3, and 5. This may be written as
# 2^2 * 3^1 * 5^1, and the number of divisors for 60 is (2 + 1)(1 + 1)(1 + 1) = 12.
# Using this information, I was able to calculate the number of divisors for a given
# number very quickly.

# Credit to http://mathschallenge.net/library/number/number_of_divisors
# for an explanation and proof of this theorem.