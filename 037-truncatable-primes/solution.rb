# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove
# digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work
# from right to left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require 'prime'

def contains_forbidden_digits?(number)
  forbidden_digits = ["0", "4", "6", "8"]
  (number.to_s.split("").uniq + forbidden_digits).uniq != number.to_s.split("").uniq + forbidden_digits
end

def left_truncatable_prime?(number)
  return true if number < 10 && number.prime?
  return false if !number.prime?
  next_number = number.to_s[0..-2].to_i
  left_truncatable_prime?(next_number)
end

def right_truncatable_prime?(number)
  return true if number < 10 && number.prime?
  return false if !number.prime?
  next_number = number.to_s[1..-1].to_i
  right_truncatable_prime?(next_number)
end

testable_numbers = []
truncatable_primes = []

Prime.each(1000000) do |prime|
  testable_numbers << prime if prime.to_s.length > 1 && !contains_forbidden_digits?(prime)
end

testable_numbers.each {|num| truncatable_primes << num if left_truncatable_prime?(num) && right_truncatable_prime?(num)}

p truncatable_primes.reduce(:+)

# => 748317

# This solution (and problem) are both problematic for me. Since we are given that only eleven such
# numbers exist, does this mean we are free to brute force our way through this until we have found
# the eleven targets? Regardless of the answer, how did mathematicians discover that only eleven such
# numbers exist? Currently, I iterate through all prime numbers up through 1,000,000, but only because
# I know that the eleven targets are all below that number. My solution could be improved if I
# found a way to iterate through an uncertain number of primes until I found all eleven values.
