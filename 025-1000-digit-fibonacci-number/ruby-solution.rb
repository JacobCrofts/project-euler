last_two = [1, 1]
fib_index = 2

while last_two[1].to_s.length < 1000
  next_fib = last_two.reduce(:+)
  fib_index += 1
  last_two[0] = last_two[1]
  last_two[1] = next_fib
end

p fib_index
