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
  while f(combo[0], combo[1], counter).prime?
    counter += 1
  end
  number_of_consecutive_primes[combo] = counter
end

best_combo = number_of_consecutive_primes.max_by{ |combo, num_of_primes| num_of_primes}

p best_combo.first.reduce(:*)
