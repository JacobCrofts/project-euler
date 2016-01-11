multiples = []
(1...1000).each do |int|
  multiples << int if int % 3 == 0 || int % 5 == 0
end

p multiples.reduce(:+)
