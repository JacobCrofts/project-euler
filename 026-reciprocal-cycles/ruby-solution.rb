def repeating_decimal_sequence(one_over_this)
  quotient = ""
  dividends = [1]

  dividend = 1
  divisor = one_over_this

  until dividends.uniq != dividends
    quotient << (dividend / divisor).to_s
    dividend = ((dividend - divisor * quotient[-1].to_i).to_s + "0").to_i
    dividends << [dividend]
  end

  start_index = dividends.find_index(dividends[-1])

  return "" if quotient[start_index..-1] == "0"
  quotient[start_index..-1]
end

sequences = {}

(1..999).each do |denominator|
  sequences[denominator] = repeating_decimal_sequence(denominator).length
end

max_pair = [0, 0]

sequences.each do |key, value|
  max_pair = [key, value] if value > max_pair[-1]
end

p max_pair[0]
