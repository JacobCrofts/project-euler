# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?

start_time = Time.now

p (2 ** 1000).to_s.split("").inject(0) {|sum, digit| sum + digit.to_i}
p "calculated in #{(Time.now - start_time) * 1000} ms"

# => 1366

# Couldn't resist the one-liner here, as the logic is very simple. It was necessary for me
# to add an argument to Array#inject to specify the starting value of my sum. Otherwise,
# Ruby assumes the starting value is an empty String.
