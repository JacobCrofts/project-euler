start_time = Time.now

def factorial(number)
  (1..number).reduce(:*)
end

def sum_of_digits(number)
  number.to_s.split("").inject(0) {|sum, char| sum + char.to_i}
end

p sum_of_digits(factorial(100))
p "calculated in #{(Time.now - start_time) * 1000} ms"
