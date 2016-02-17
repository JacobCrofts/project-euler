def distinct_power_terms(max_exponent)
  exponents = (2..max_exponent).to_a.product((2..max_exponent).to_a)
  exponents.map {|pair| pair[0]**pair[1]}.uniq.length
end

p distinct_power_terms(100)
