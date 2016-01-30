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


# I refactored this for performance by saving the collatz sequence length of
# each number and reusing it should that number be part of a larger sequence.
