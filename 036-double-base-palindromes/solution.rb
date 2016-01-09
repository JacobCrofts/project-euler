# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include leading zeros.)

start_time = Time.now

def palindromic?(number)
  number.to_s.reverse == number.to_s
end

def start_power(number)
  start_power = 0
  start_power += 1 until 2**start_power > number
  start_power - 1
end

def to_binary(number)
  return "" if number == 0
  new_number = number - 2**start_power(number)
  binary_number = "1" + "0" * (start_power(number) - start_power(new_number) - 1)
  binary_number + to_binary(new_number)
end

p (1..1_000_000).to_a.select {|number| palindromic?(number) && palindromic?(to_binary(number))}.reduce(:+)
p "calculated in #{(Time.now - start_time) * 1000} ms"

# => 872187

# This exercise had me scratching my head over what determines the efficiency of ruby
# methods. I'm running a recursive method (plus several others) on all numbers from one
# through a million, yet the runtime is under a second. This problem comes at an interesting
# time: right after several problems in which the main point of the exercise was to show us
# the importance of sanitizing our method input when iterating through long ranges.
