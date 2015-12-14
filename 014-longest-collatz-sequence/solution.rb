# n -> n/2 if n is even
# n -> 3n + 1 if n is odd

def collatz_sequence_length(integer)
  length = 0
  num = integer
  until num == 1
    num = num % 2 == 0 ? num / 2 : num * 3 + 1
    length += 1
  end
  length + 1
end

max_length = 0
max_number = 0

(1..999_999).each do |num|
  if collatz_sequence_length(num) > max_length
    max_length = collatz_sequence_length(num)
    max_number = num
  end
end

solution = max_number

p solution

# => 837799

# Further refactoring: start at 999,999 and work down. Eliminate all numbers generated
# by the sequence.