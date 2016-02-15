def repeating_decimal_sequence_length(divisor)
  dividends = {}
  decimal_sequence = ''
  current_dividend = 10
  start_index = nil

  until dividends[current_dividend]
    decimal_sequence += (current_dividend / divisor).to_s
    dividends[current_dividend] = true
    current_dividend = (current_dividend % divisor) * 10
  end

  start_index = dividends.keys.index(current_dividend)

  decimal_sequence[start_index..-1].length
end

max_sequence_length = {0 => 0}

(1...1000).each do |divisor|
  next_sequence_length = repeating_decimal_sequence_length(divisor)
  if next_sequence_length > max_sequence_length.values.first
    max_sequence_length = {divisor => next_sequence_length}
  end
end

p max_sequence_length.keys.first
