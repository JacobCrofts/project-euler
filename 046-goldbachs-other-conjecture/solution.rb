# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of
# a prime and twice a square.

# 9 = 7 + 2 × 1^2
# 15 = 7 + 2 × 2^2
# 21 = 3 + 2 × 3^2
# 25 = 7 + 2 × 3^2
# 27 = 19 + 2 × 2^2
# 33 = 31 + 2 × 1^2

# It turns out that the conjecture was false.

# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?


require 'prime'

class Integer

  def odd_comp?
    !self.prime? && self.odd?
  end

  def smaller_twice_squares
    (1..Math.sqrt(self)).to_a.map {|x| 2 * x**2}
  end

  def smaller_primes
    Prime.take_while {|prime| prime < self}
  end

  def goldbach_product?

  end

end