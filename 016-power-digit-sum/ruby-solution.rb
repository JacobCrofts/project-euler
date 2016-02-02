start_time = Time.now

p (2 ** 1000).to_s.split("").inject(0) {|sum, digit| sum + digit.to_i}
p "calculated in #{(Time.now - start_time) * 1000} ms"

# => 1366
