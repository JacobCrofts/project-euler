# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.

# What is the 10,001st prime number?

def prime?(number)
  return false if number < 2
  (2..Math.sqrt(number)).each do |possible_factor|
    return false if number % possible_factor == 0
  end
  true
end

def first_n_primes(n)
  primes = []
  counter = 2
  until primes.length == n
    primes << counter if prime?(counter)
    counter += 1
  end
  primes
end

solution = first_n_primes(10001).last

p solution

# => 104743


# This may be solved in two lines if we use the Prime class:

# require 'prime'
# Prime.take(10001).last

# But I took this as an opportunity to build a prime number
# generator from stratch.