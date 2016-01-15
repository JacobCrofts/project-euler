# The first two consecutive numbers to have two distinct prime factors are:

# 14 = 2 × 7
# 15 = 3 × 5

# The first three consecutive numbers to have three distinct prime factors are:

# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.

# Find the first four consecutive integers to have four distinct prime factors. What is the first
# of these numbers?

require 'prime'

class Integer

  def next_factor
    possible_factor = 2
    until self % possible_factor == 0 && possible_factor.prime?
      possible_factor += 1
    end
    possible_factor
  end

  def prime_factors
    return [self] if self.prime?
    [self.next_factor, (self / self.next_factor).prime_factors].flatten
  end

  def distinct_prime_factors
    self.prime_factors.uniq.length
  end

end

consecutive_foursies = 0
integer = 2
# It's easier to start at 2 than to write an exception for 1 in prime_factors.

until consecutive_foursies == 4
  if integer.distinct_prime_factors == 4
    consecutive_foursies += 1
  else
    consecutive_foursies = 0
  end
  integer += 1
end

p integer - 4

# => 134043
