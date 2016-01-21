# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

start_time = Time.now

require 'prime'

p Prime.each(2_000_000).reduce(:+)
p "calculated in #{(Time.now - start_time) * 1000} ms"

# => 142913828922
