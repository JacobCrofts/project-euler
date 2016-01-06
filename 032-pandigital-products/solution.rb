# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
# for example, the 5-digit number, 15234, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and
# product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a
# 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

start_time = Time.now

def pan_1_thru_9?(string)
  string.length == 9 && string.split("").sort == (1..string.length).to_a.sort.map {|x| x.to_s}
end

def pandigital_product?(multiplicand, multiplier)
  pan_1_thru_9?(multiplicand.to_s + multiplier.to_s + (multiplicand * multiplier).to_s)
end

def contains_repeating_chars?(number)
  a = number.to_s.split("").sort
  a.uniq != a
end

def minimum_multiplier(int)
  10 ** (4 - int.to_s.length)
end

def maximum_multiplier(int)
  10000 / int
end

pandigital_products = []

options = (1..9999).to_a.delete_if {|option| contains_repeating_chars?(option)}

options.each do |num1|
  (minimum_multiplier(num1)..maximum_multiplier(num1)).each do |num2|
    pandigital_products << [num1, num2].sort if pandigital_product?(num1, num2)
  end
end

p pandigital_products.uniq.inject(0) {|sum, products| sum + products.reduce(:*)}
puts "Found solution in #{(Time.now - start_time) * 1000} ms"

# => 56370

# Defining an acceptable multiplier range for each number in (1..9999) optimized this problem very
# nicely, bringing the runtime down from over 20 seconds to under 700ms. Ignoring items within that
# range that contain repeating characters also helps marginally.
