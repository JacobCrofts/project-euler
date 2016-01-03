# In England the currency is made up of pound, £, and pence, p, and there are eight coins in
# general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

# It is possible to make £2 in the following way:

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

# How many different ways can £2 be made using any number of coins?

def value(coins)
  values = [1, 2, 5, 10, 20, 50, 100, 200]
  (0..7).inject(0) {|sum, index| sum + coins[index] * values[index]}
end

def ways_to_make_change(pence)
  options = [[pence, 0, 0, 0, 0, 0, 0, 0]]
  next_option = options.last
end

# p ways_to_make(5, [1, 2])

# [1, 2]

# [5, 0]
# [3, 1]
# [1, 2]



# def ways_to_make(value)
#   puts "finding ways to make #{value}"
#   return value if (0..2).include?(value)
#   usable_coins = [1, 2, 5, 10, 20, 50, 100, 200].delete_if {|coin| coin > value}

#   if value.odd?
#     ways_to_make(value - 1)
#   elsif value % 200 == 0
#     1 + 2 * ways_to_make(100)
#   elsif value % 100 == 0
#     1 + 2 * ways_to_make(50)
#   elsif value
#   end

# end

# p ways_to_make(5)

# 5: 3