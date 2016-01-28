start_time = Time.now

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

p first_n_primes(10001).last
p "calculated in #{(Time.now - start_time) * 1000} ms"



# This may be solved very quickly and in only two lines if we use the Prime class:

# require 'prime'
# Prime.take(10001).last

# But I took this as an opportunity to build a prime number generator from stratch.
# I'll let my original solution stay for educational purposes.
