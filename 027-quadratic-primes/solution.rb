# Euler discovered the remarkable quadratic formula:

# n² + n + 41

# It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39.
# However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when
# n = 41, 41² + 41 + 41 is clearly divisible by 41.

# The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the
# consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.

# Considering quadratics of the form:

# n² + an + b, where |a| < 1000 and |b| < 1000

# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |−4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression that produces
# the maximum number of primes for consecutive values of n, starting with n = 0.

require 'prime'

def f(a, b, n)
  n**2 + a*n + b
end

a_possibilities = (-999..999).to_a
b_possibilities = Prime.each(999).to_a
# We know that |b| must be prime and positive because f(a, b, 0) must be prime and positive.
# f(a, b, 0) = 0² + a*0 + b = b.
# Code that does not take advantage of this information will probably take a long time to run.

combos = a_possibilities.product(b_possibilities)

number_of_consecutive_primes = {}

combos.each do |combo|
  counter = 0
  until !f(combo[0], combo[1], counter).prime?
    counter += 1
  end
  number_of_consecutive_primes[combo] = counter
end

best_combo = number_of_consecutive_primes.max_by{ |combo, num_of_primes| num_of_primes}

p best_combo.first.reduce(:*)

# => -59231
# The equation we're looking for is n² - 61n + 971 and the number of primes is 71.
