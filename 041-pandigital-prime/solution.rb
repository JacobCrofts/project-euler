# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly
# once. For example, 2143 is a 4-digit pandigital and is also prime.

# What is the largest n-digit pandigital prime that exists?

require 'prime'

pandigitals = []

(2..9).each do |number|
  pandigitals << (1..number).to_a.permutation(number).to_a
end

pandigitals = pandigitals.flatten(1).map {|combo| combo.join("").to_i}.reverse

index = 0

until pandigitals[index].prime?
  index += 1
end

p pandigitals[index]

# => 7652413

# I found myself sifting through pandigitals in search of a prime number rather than sifting through
# primes in search of a pandigital. The latter's runtime makes this approach necessary.
