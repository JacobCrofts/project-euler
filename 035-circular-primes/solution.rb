# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719,
# are themselves prime.

# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

# How many circular primes are there below one million?

start_time = Time.now

require 'prime'

def contains_even_digits?(number)
  evens = ["2", "4", "6", "8", "0"]
  (number.to_s.split("").uniq + evens).uniq != number.to_s.split("").uniq + evens
end

def number_to_array(number)
  number.to_s.split("").map {|x| x.to_i}
end

def rotations(number)
  rotations = []
  until rotations.uniq != rotations
    rotations << number
    number = number_to_array(number).rotate.join("").to_i
  end
  rotations.uniq
end

def circular_prime?(number)
  rotations(number).each do |rotation|
    return false if !rotation.prime?
  end
  return true
end

circular_primes = []

numbers_to_check = [2]
Prime.each(999_999) do |prime|
  numbers_to_check << prime unless contains_even_digits?(prime)
end

numbers_to_check.each do |number|
  if circular_prime?(number)
    circular_primes << number
  end
end

p circular_primes.length
puts "calculation took #{(Time.now - start_time) * 1000} ms"

# => 55

# This problem is another exercise in optimization. Iterating through a million numbers to see which are
# circular primes is easy but inefficient. We must filter our input if we want to arrive at the solution
# quickly.
