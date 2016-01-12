# An irrational decimal fraction is created by concatenating the positive integers:

# 0.123456789101112131415161718192021...

# It can be seen that the 12th digit of the fractional part is 1.

# If dn represents the nth digit of the fractional part, find the value of the following expression.

# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000


champ_constant = []

(1..1000000).each do |number|
  champ_constant << number.to_s.split("")
end

champ_constant.flatten!

p champ_constant[0].to_i * champ_constant[9].to_i * champ_constant[99].to_i * champ_constant[999].to_i * champ_constant[9999].to_i * champ_constant[99999].to_i * champ_constant[999999].to_i

# => 210
