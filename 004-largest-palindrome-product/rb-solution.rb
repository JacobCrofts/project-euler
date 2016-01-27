start_time = Time.now

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

p palindrome_products.max
p "calculated in #{(Time.now - start_time) * 1000} ms"
