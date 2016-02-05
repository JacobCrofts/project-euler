def abundant?(number)
  divisors = []
  (1..number / 2).each do |possible_divisor|
    divisors << possible_divisor if number / possible_divisor == number.to_f / possible_divisor
  end
  divisors.reduce(:+) > number
end

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
