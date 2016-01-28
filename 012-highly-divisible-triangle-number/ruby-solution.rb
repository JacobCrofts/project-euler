start_time = Time.now

require 'prime'

class Integer

  def prime_factors
    return 0 if self < 2
    return [self] if self.prime?
    factors = []
    counter = 2
    until self % counter == 0
      counter += 1
    end
    factors << [counter, (self / counter).prime_factors]
    factors.flatten
  end

  def number_of_divisors
    return 0 if self < 4
    counts = {}
    self.prime_factors.each do |factor|
      counts[factor] ||= 0
      counts[factor] += 1
    end
    counts.each_value.inject(1) {|prod, value| prod * (value + 1)}
  end

end

triangle_number = 1
index = 1
until triangle_number.number_of_divisors > 500
  index += 1
  triangle_number += index
end

p triangle_number
p "calculated in #{(Time.now - start_time) * 1000} ms"

# => 76576500


# My original approach was to iterate through (1..integer) and simply count the
# number of divisors in that range using modulo. It works fine with small numbers,
# but with larger ones it takes too long to run.

# The trick here, and I think this puzzle is unsolvable without it, is that
# if a number's prime factors are listed like this: a^r * b^s * ..., then the
# number of divisors for the number is (r + 1) * (s + 1) * ... . For example,
# the prime factors of 60 are 2, 2, 3, and 5. This may be written as
# 2^2 * 3^1 * 5^1, and the number of divisors for 60 is (2 + 1)(1 + 1)(1 + 1) = 12.
# Using this information, I was able to calculate the number of divisors for a given
# number very quickly.

# Credit to http://mathschallenge.net/library/number/number_of_divisors
# for an explanation and proof of this theorem.
