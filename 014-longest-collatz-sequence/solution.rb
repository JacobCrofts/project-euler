# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
# Although it has not been proven yet (Collatz Problem), it is thought that all starting
# numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

start_time = Time.now

sequence_lengths = {}

(1...1_000_000).each do |number|

  length = 1
  num = number
  until num == 1
    if sequence_lengths[num]
      length += sequence_lengths[num] - 1
      break
    end
    num = (num.even? ? num / 2 : 3 * num + 1)
    length += 1
  end
  sequence_lengths[number] = length
end

p sequence_lengths.max_by {|key, value| value}.first
p "calculated in #{(Time.now - start_time) * 1000} ms"

# => 837799

# I refactored this for performance by saving the collatz sequence length of
# each number and reusing it should that number be part of a larger sequence.
