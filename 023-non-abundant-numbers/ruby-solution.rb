start_time = Time.now

require 'prime'

class Integer

  def sum_of_divisors
    divisors = [0]
    sqrt = Math.sqrt(self)
    (2..sqrt).each do |possible_divisor|
      if self % possible_divisor == 0
        divisors << possible_divisor
        unless possible_divisor == sqrt
          divisors << self / possible_divisor
        end
      end
    end
    divisors.reduce(:+) + 1
  end

  def abundant?
    self.sum_of_divisors > self
  end

end

abundant_numbers = []
sums = []

(1..28123).each do |possible_abundant|
  abundant_numbers << possible_abundant if possible_abundant.abundant?
end

abundant_numbers.each do |ab_num|
  abundant_numbers.each do |other_ab_num|
    break if other_ab_num > ab_num
    sums << ab_num + other_ab_num
  end
end

p ((1..28123).to_a - sums).reduce(:+)
p "Calculated in #{(Time.now - start_time) * 1000} ms"

# => 4179871
