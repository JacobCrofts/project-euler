# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

require 'prime'

prime_factors = []

Prime.each(Math.sqrt(600851475143)) do |prime|
  prime_factors << prime if 600851475143 % prime == 0
end

solution = prime_factors.max

p solution

# => 6857
