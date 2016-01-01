def amicable?(number)
  sum_of_divisors(sum_of_divisors(number)) == number && sum_of_divisors(number) != number
end

def sum_of_divisors(number)
  divisors = []
  (1..number / 2).each do |possible_divisor|
    divisors << possible_divisor if number % possible_divisor == 0
  end
  divisors.reduce(:+)
end

amicable_numbers = []

(2..9999).each do |possible_amicable|
  amicable_numbers << possible_amicable if amicable?(possible_amicable)
end

p amicable_numbers.reduce(:+)

# => 31626
