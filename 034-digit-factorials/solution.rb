# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

# Find the sum of all numbers which are equal to the sum of the factorial of their digits.

# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

start_time = Time.now

def factorial(number)
  return 1 if number == 0
  (1..number).to_a.reduce(:*)
end

def curious_number?(number)
  number == number.to_s.split("").reduce(0) {|sum, digit| sum + factorial(digit.to_i)}
end

digit_factorials = (0..9).map {|x| factorial(x)}

possible_sums = []

2.upto(7).each do |combo_index|
  possible_sums << digit_factorials.repeated_combination(combo_index).to_a
end

possible_sums.each do |set_of_sets_of_sums|
  set_of_sets_of_sums.map! do |set_of_sums|
    set_of_sums.reduce(:+)
  end
end

curious_numbers = []

possible_sums.flatten.each do |num|
  curious_numbers << num if curious_number?(num)
end

p curious_numbers.uniq.delete_if {|x| x <= 2}.reduce(:+)
puts "calculated in #{(Time.now - start_time) * 1000} ms"

# => 40730

# My solution runs quickly but seems a little hacky, like I moved data around inefficiently and with
# too many chained method calls. I was hoping to find a solution with more finesse. There are only two
# curious numbers, it turns out: 145 and 40585. If I had simply iterated through (3..40585) and plucked
# out all the numbers that are curious, I would have arrived at the correct solution very quickly. But
# this would be very bad practice, as the first mathematician tackling this problem would not have known
# to stop at 40585.

# We do know, however, that numbers eventually reach a point at which their maximum digit-factorial-sum
# cannot possibly exceed the numbers themselves. The sum of the factorials of the digits in 9,999,999 is
# around 2.5 million - not nearly enough. Since 999,999's digit-factorial-sum is still in the acceptable
# range, we can safely conclude that we need to check up through and including the seven-digit-numbers,
# but no further.

# Trouble is, iterating through the seven-digit numbers with brute force takes a very long time. So I
# found all of the possible digit-factorial-sums using the internal repeated_combination method and
# iterated through those instead.

# One more thing to note: as much as I enjoy recursion, it seems the recursive factorial method, while
# around as efficient as the iterative one for small numbers, has little practical purpose in problems
# like these. Calling it many times in the same program, even for small numbers, will produce a stack error.
