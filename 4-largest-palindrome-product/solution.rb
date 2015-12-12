# A palindromic number reads the same both ways. The largest
# palindrome made from the product of two 2-digit numbers is
# 9009 = 91 × 99.

# Find the largest palindrome made from the product of two
# 3-digit numbers.

def palindrome?(number)
  number.to_s.reverse == number.to_s
end

palindrome_products = []

(100..999).each do |first_factor|
  (100..999).each do |second_factor|
    if palindrome?(first_factor * second_factor)
      palindrome_products << (first_factor * second_factor)
    end
  end
end

solution = palindrome_products.max

p solution

# => 906609
