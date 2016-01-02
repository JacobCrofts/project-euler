# A perfect number is a number for which the sum of its proper divisors is exactly equal to the
# number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28,
# which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is
# called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can
# be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown
# that all integers greater than 28123 can be written as the sum of two abundant numbers. However,
# this upper limit cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers is less than this
# limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant
# numbers.

def abundant?(number)
  # return false if (1..11).include?(number)
  divisors = []
  (1..number / 2).each do |possible_divisor|
    divisors << possible_divisor if number / possible_divisor == number.to_f / possible_divisor
  end
  divisors.reduce(:+) > number
end

# numbers_to_check = (1..28123).to_a
abundant_numbers = []
sums = []

(12..28123).each do |possible_abundant|
  abundant_numbers << possible_abundant if abundant?(possible_abundant)
end

abundant_numbers.each do |ab_num|
  abundant_numbers.each do |other_ab_num|
    sums << ab_num + other_ab_num
  end
end

p ((1..28123).to_a - sums).reduce(:+)

# => 4179871

# This solution has the longest runtime of any euler problem I have solved, at around 40 seconds.
# Perhaps there's a better way of handling this. My code spends far more time trying to calculate
# a number's divisors than on anything else.
