# In England the currency is made up of pound, £, and pence, p, and there are eight coins in
# general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

# It is possible to make £2 in the following way:

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

# How many different ways can £2 be made using any number of coins?

def value(coins, options)
  (0..options.length - 1).inject(0) {|sum, index| sum + coins[index] * options[index]}
end

def value_with_ones(options)
  options.reduce(:+)
end

def option_combos(value, array_of_options)
  option_combos = []
  filtered_options = array_of_options.sort.delete_if {|option| option > value}
  (1..filtered_options.length).each do |x|
    option_combos << filtered_options.combination(x).to_a
  end
  option_combos.flatten(1).delete_if {|combo| combo.reduce(:+) > value}
end

def ways_to_make(value, options)
  combos = option_combos(value, options)
  combos.length + ways_to_make(value)
end

# p value([1, 1, 1, 1, 1, 1, 1, 1], [1, 2, 5, 10, 20, 50, 100, 200])

p option_combos(200, [1, 2, 5, 10, 20, 50, 100, 200])

