start_time = Time.now

class Integer

  def amicable?
    return false if self < 2
    self.sum_of_divisors.sum_of_divisors == self && self.sum_of_divisors != self
  end

  def sum_of_divisors
    divisors = []
    (1..self / 2).each do |possible_divisor|
      divisors << possible_divisor if self % possible_divisor == 0
    end
    divisors.reduce(:+)
  end

end

amicable_numbers = []

(1...10_000).each do |possible_amicable|
  amicable_numbers << possible_amicable if possible_amicable.amicable?
end

p amicable_numbers.reduce(:+)
p "calculated in #{(Time.now - start_time) * 1000} ms"

# => 31626
