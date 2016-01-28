start_time = Time.now

require 'prime'

p Prime.each(2_000_000).reduce(:+)
p "calculated in #{(Time.now - start_time) * 1000} ms"
