# The Fibonacci sequence is defined by the recurrence relation:

# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:

# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144

# The 12th term, F12, is the first term to contain three digits.

# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

def nth_fib(n)
  fib_nums = [1, 1]
  [n - 2, 0].max.times {fib_nums << fib_nums[-1] + fib_nums[-2]}
  fib_nums[-1]
end

n_to_check = 1
until nth_fib(n_to_check).to_s.length == 1000
  n_to_check += 1
end

p n_to_check

# => 4782

# Since we're dealing with large numbers, I knew immediately that my old recursive nth_fib
# method wouldn't run quickly enough for the purposes of this problem.