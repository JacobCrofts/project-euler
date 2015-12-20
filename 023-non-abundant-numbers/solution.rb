def abundant?(number)
  divisors = []
  (1..number / 2).each do |possible_divisor|
    divisors << possible_divisor if number % possible_divisor == 0
  end
  divisors.reduce(:+) > number
end

abundant_numbers = []

(2..28123).each do |possible_abundant|
  abundant_numbers << possible_abundant if abundant?(possible_abundant)
end

sums = []

abundant_numbers.combination(2).each do |combo|

end

# =>
