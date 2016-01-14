# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9
# in some order, but it also has a rather interesting sub-string divisibility property.

# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17

# Find the sum of all 0 to 9 pandigital numbers with this property.

start_time = Time.now

require 'prime'

def pandigital?(number)
  number.to_s.split("").uniq == number.to_s.split("")
end

def filter(array_product, value)
  array_product.delete_if {|subarr| !(subarr.join("")[0..2].to_i % value == 0)}
  array_product.delete_if {|subarr| !pandigital?(subarr.join("").to_i)}
  array_product.map {|subarr| subarr.join("")}
end

def add_first_digit(substring_compound)
  first_digit = ("0".."9").to_a - substring_compound.to_s.split("")
  (first_digit.first + substring_compound).to_i
end

viable_hundreds = (100...999).select {|num| pandigital?(num)}
next_digits = (0..9).to_a

substrings = viable_hundreds.select {|substr| substr % 17 == 0}

primes = Prime.first(6).to_a.reverse

primes.each do |prime|
  substrings = filter(next_digits.product(substrings), prime)
end

substrings.map! {|substr| add_first_digit(substr)}
p substrings.delete_if {|substr| !pandigital?(substr)}.reduce(:+)

puts "Time elapsed: #{(Time.now - start_time) * 1000} ms"

# => 16695334890

# I refactored this problem a bunch because my initial solution took a very long time to run - 83
# seconds. Rather than constructing pandigital numbers first, then filtering them according to whether
# they have this special substring property, or constructing primes first and then filtering, I now
# filter my substrings each step of the way, adding only one digit at a time. This may seem tedious
# at first, but it winds up needing much less code and runs in under 20 ms.
