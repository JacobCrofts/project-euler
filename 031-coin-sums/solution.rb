# In England the currency is made up of pound, £, and pence, p, and there are eight coins in
# general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

# It is possible to make £2 in the following way:

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

# How many different ways can £2 be made using any number of coins?

# $used_combos = []

def value(coins, options)
  (0..options.length - 1).inject(0) {|sum, index| sum + coins[index] * options[index]}
end

def possible_to_sum?(value, combo)

  return false if combo.reduce(:+) > value

  combo.each do |coin_value|
    return true if (value - combo.reduce(:+)) % coin_value == 0
  end

  (1..value / combo.min).each do |times_to_combo|
    combo.repeated_combination(times_to_combo).to_a.each do |coin_combination|
      return true if (coin_combination.reduce(:+) + combo.reduce(:+) == value)
    end
  end
  false
end

def option_combos(value, array_of_options)
  option_combos = []
  filtered_options = array_of_options.sort.delete_if {|option| option > value}
  (1..filtered_options.length).each do |x|
    option_combos << filtered_options.combination(x).to_a
  end
  option_combos.flatten(1).delete_if {|combo| !possible_to_sum?(value, combo)}
end

def ways_to_make(value, options)
  combos = option_combos(value, options)
  return 1 if combos == []
  combos.reduce(0) {|sum, combo| sum + ways_to_make(value - combo.reduce(:+), combo)}
end

p ways_to_make(200, [1, 2, 5, 10, 20, 50, 100, 200])

# => 73682

# A quick scan of the interwebs has shown me that there are much more efficient ways of doing this.
# I will have to refactor this later.
