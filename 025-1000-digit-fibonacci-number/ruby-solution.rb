fibonacci = [1, 1]

while fibonacci.last.to_s.length < 1000
  fibonacci << fibonacci[-1] + fibonacci[-2]
end

p fibonacci.length
