# n! means n × (n − 1) × ... × 3 × 2 × 1

# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

# p (1..100).reduce(:*).to_s.split("").inject(0) {|sum, char| sum + char.to_i}

# p (1..100).reduce(:*)

def factorial(number)
  (1..number).reduce(:*)
end

def sum_of_digits(number)
  number.to_s.split("").inject(0) {|sum, char| sum + char.to_i}
end

solution = sum_of_digits(factorial(100))

p solution

# => 648
