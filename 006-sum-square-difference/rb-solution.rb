start_time = Time.now

sum_of_squares = (1..100).inject {|sum, int| sum + int ** 2 }
square_of_sum = (1..100).reduce(:+) ** 2

p square_of_sum - sum_of_squares
p "calculated in #{(Time.now - start_time) * 1000} ms"
