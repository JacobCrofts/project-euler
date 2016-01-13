# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9
# in some order, but it also has a rather interesting sub-string divisibility property.

# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17

# Find the sum of all 0 to 9 pandigital numbers with this property.

start_time = Time.now

require 'prime'

def pandigital?(number)
  number.to_s.split("").uniq == number.to_s.split("")
end

viable_hundreds = (100...999).select {|num| pandigital?(num)}

divisible_substrings_2 = viable_hundreds.select {|x| x % 2 == 0}
divisible_substrings_3 = viable_hundreds.select {|x| x % 3 == 0}
divisible_substrings_5 = viable_hundreds.select {|x| x % 5 == 0}
divisible_substrings_7 = viable_hundreds.select {|x| x % 7 == 0}
divisible_substrings_11 = viable_hundreds.select {|x| x % 11 == 0}
divisible_substrings_13 = viable_hundreds.select {|x| x % 13 == 0}
divisible_substrings_17 = viable_hundreds.select {|x| x % 17 == 0}


p viable_hundreds
# (100...999).to_a.select {|number| number.even?}




# def has_substring_property?(pandigital)
#   return false if pandigital.to_s.length != 10
#   substrings = []
#   primes = Prime.first(7)

#   (1..7).each do |index|
#     substrings << pandigital.to_s[index..index + 2]
#   end

#   substrings.each_with_index {|substr, i| return false if substr.to_i % primes[i] != 0}

#   true
# end

# pandigitals09 = (0..9).to_a.permutation(10).to_a.map {|digits| digits.join("").to_i}

# p pandigitals09.length

# pandigitals09.select! {|pan| pan.to_s[3].to_i % 2 == 0 && pan.to_s[5].to_i % 5 == 0}

# p pandigitals09.length

# pandigitals09.select! {|pan| has_substring_property?(pan.to_i)}

# p pandigitals09.reduce(:+)

puts "Time elapsed: #{(Time.now - start_time)} sec"

# => 16695334890

# After some refactoring, I managed to get the time down from 83 seconds to 23 seconds. However, this solution is even worse in terms of having chained methods everywhere and redundant code... I will refactor this again later so that I calculate possible substrings first, then chain the compatable ones together.
