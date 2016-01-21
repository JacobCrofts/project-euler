start_time = Time.now

multiples = []
(1...1000).each do |int|
  multiples << int if int % 3 == 0 || int % 5 == 0
end

p multiples.reduce(:+)
p "calculated in #{(Time.now - start_time) * 1000} ms"
