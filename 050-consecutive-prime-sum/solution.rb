# The prime 41, can be written as the sum of six consecutive primes:

# 41 = 2 + 3 + 5 + 7 + 11 + 13

# This is the longest sum of consecutive primes that adds to a prime below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime contains 21 terms,
# and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most consecutive primes?

require 'prime'

def longest_sum_below(max)
  sums_and_terms = {2 => 1}
  primes = Prime.take_while {|prime| prime <= max / 21}

  primes.each do |prime|
    sum = 0
    terms = 0
    primes.select {|p| p >= prime}.each do |p|
      sum += p
      terms += 1
      break if sum >= max
      sums_and_terms[sum] = terms unless !sum.prime? || sums_and_terms[sum]
    end
  end
  sums_and_terms.max_by {|key, value| value}.first
end

p longest_sum_below(1_000_000)

# => 997651

I have found the solution here, but only after making a very reasonable but still somewhat arbitrary
constraint on my primes array (line 16). Once I can dynamically establish an upper bound, this method
will work for numbers other than 1000000.