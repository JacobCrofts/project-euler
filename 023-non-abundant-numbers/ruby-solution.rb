start_time = Time.now

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

abundant_numbers.each_with_index do |ab_num, index|
  counter = 0
  while counter <= index
    sums << ab_num + abundant_numbers[counter]
    counter += 1
  end
end

p ((1..28123).to_a - sums).reduce(:+)
p "Calculated in #{(Time.now - start_time) * 1000} ms"
