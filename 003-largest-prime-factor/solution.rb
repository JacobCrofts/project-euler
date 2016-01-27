start_time = Time.now

require 'prime'

prime_factors = []

Prime.each(Math.sqrt(600851475143)) do |prime|
  prime_factors << prime if 600851475143 % prime == 0
end

p prime_factors.max
p "calculated in #{(Time.now - start_time) * 1000} ms"
