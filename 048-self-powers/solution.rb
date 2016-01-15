# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

integers = (1..1000).to_a
powers = integers.map {|integer| integer ** integer}
sum = powers.reduce(:+)
last_10 = sum.to_s[-10..-1].to_i

p last_10

# => 9110846700

# Or, the one-liner (couldn't resist):

# p (1..1000).to_a.map {|x| x ** x}.reduce(:+).to_s[-10..-1].to_i
