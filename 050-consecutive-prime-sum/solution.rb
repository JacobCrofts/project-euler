# The prime 41, can be written as the sum of six consecutive primes:

# 41 = 2 + 3 + 5 + 7 + 11 + 13

# This is the longest sum of consecutive primes that adds to a prime below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime contains 21 terms,
# and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most consecutive primes?

require 'prime'

def longest_sum_below(max)
  sum_and_terms = {2 => 1}
  primes = Prime.take_while {|prime| prime <= max}

  primes.each do |prime|
    break if prime * sum_and_terms.max_by {|key, value| value}.last > max
    sum = 0
    terms = 0
    primes.select {|p| p >= prime}.each do |p|
      sum += p
      terms += 1
      break if sum >= max
      sum_and_terms[sum] = terms unless !sum.prime? || sum_and_terms[sum]
    end
  end
  sum_and_terms.max_by {|key, value| value}.first
end

p longest_sum_below(1000000)

# => 997651

# The "break if" lines make my code run much more quickly by ending unnecessary operations before they
# begin. This is the first time I have successfully and purposefully implemented break within a loop.
