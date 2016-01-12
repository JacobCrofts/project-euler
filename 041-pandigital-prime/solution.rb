# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly
# once. For example, 2143 is a 4-digit pandigital and is also prime.

# What is the largest n-digit pandigital prime that exists?

require 'prime'

def pandigital?(number)
  digits = number.to_s.split("").map {|digit| digit.to_i}
  print digits.sort
  print (1..number.to_s.length).to_a
  digits.sort == (1..number.to_s.length).to_a
end

# We need to sift through pandigitals, not primes, for performance's sake. The method we have now will not be used. :(

# (1..100).each do |num|
#   puts num if pandigital?(num)
# end

# Prime.each(10000000) do |prime|
#   puts prime if pandigital?(prime)
# end